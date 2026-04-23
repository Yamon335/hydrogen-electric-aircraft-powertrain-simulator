function em = init_EM(motor_type, scaling)
    % init_EM  Initialize electric-motor data for a given motor type
    %  
    %   em = init_EM(motor_type, scaling)

    %--- Default scaling if not provided
    if nargin < 2 || isempty(scaling)
        scaling = 1;
    end
    motor_type='Leaf Motor';
    %--- 1) Map motor_type to filename
    switch motor_type
        case 'Leaf Motor'
            filename = 'motor_type 1.mat';
        case 'Other Motor'
            filename = 'motor_type 2.mat';
        otherwise
            error('init_EM:unknownMotorType', ...
                  'Unknown motor type "%s".', motor_type);
    end

    %--- 2) Build full path & verify
    filePath = fullfile('data', filename);
    if exist(filePath, 'file') ~= 2
        error('init_EM:missingFile', ...
              'Motor data file not found: %s', filePath);
    end

   
    S = load(filePath);

    %--- 4) Base parameters
    em.scaling     = scaling;
    em.motor_type  = motor_type;

    %--- 5) Fill the output struct
    em.Efficiency      = S.efficiency_sorted;
    em.peak_torque     = em.scaling * S.Shaft_Torque_max;
    em.peak_torque_gen = em.scaling * S.Shaft_Torque_max_gen;
    em.peak_speed      = S.Speed_max;
    em.nomi_speed      = S.nomi_speed;
    em.nomi_speed_eff  = S.nomi_speed1_sorted;
    em.nomi_torque     = em.scaling * S.nomi_T;
    em.nomi_torque_eff = em.scaling * S.T_sorted;
    em.nomi_torque_gen = -em.scaling * S.nomi_T;

    %--- 6) Build sorted grids & efficiency map
    Tvec = em.nomi_torque_eff(:)'; 
    Nvec = em.nomi_speed_eff(:)';

    [em.T_sorted, idxT] = unique(-Tvec, 'sorted');
    [em.N_sorted, idxN] = unique(Nvec, 'sorted');
    em.efficiency_sorted = S.efficiency_sorted(idxT, idxN);
    em.w_EM_upper = max(em.nomi_speed_eff);  
end