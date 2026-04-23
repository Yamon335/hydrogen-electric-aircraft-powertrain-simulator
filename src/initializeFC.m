function fc = initializeFC(aircraft, fcType)

    kappa_air       = 1.4;                                                                  % Isentropic exponent                       [-]
    R_air     		= 287;                                  % [J/kg.K]
    fc.eta_C=0.7;
    pi_C=1.3;
    fc.l_air=1.5;       %air stoichiometric ratio                    
    fc.cp_air          = kappa_air/(kappa_air-1)*R_air;                                        % Specific heat                             [J/kg'K]
    fc.M_air           = 29;                                                                 % Molecular weight                          [kg/kmol]    
    fc.h_C_air 	=(pi_C^((kappa_air-1)/kappa_air)-1);                % Enthalpy difference                     
    fc.g=1.4; % ratio of the specific heat capacities
    fc.effi_driver=0.87; %compressor driver efficiency
    fc.effi_isent= 0.76; % compressor isentropic efficiency
    fc.V0=1.229; %V
    fc.R=8.314; %J/mo;.K
    %fc.T_stack=343.15; %K at 70 celsius
    fc.F=96485; %C/mol
    fc.P_H2O=31*1e3; %0.47atm from steam tables at 70 celsius
    fc.HHV_H2=142*1e6; % Higher Heating Value of H2 in J/kg
    fc.p_stack=160000; %pressure by stack {1.6,1.8} bar 
    fc.thickness_fc=1.34*1e-3;     %mm
    % 1) Pick stack voltage by aircraft
    %--------------------------------------
    switch aircraft
        case 'HAPSS'
            fc.Vstack = 700;   % V (range 500–800)
            fc.P_fc_max=5.6*1e6;  %MW

        case 'AirBus A320 neo'
            fc.Vstack = 900;   % V (range 800–1000)
              fc.P_fc_max=5.6*1e6;  %MW
        case 'ATR72-600'
            fc.Vstack = 700;   % V (range 600–800)
              fc.P_fc_max=5.6*1e6;  %MW
        case 'pipstrel velis'
           fc. Vstack = 345;   % V
              fc.P_fc_max=3.5*1e6;  %MW
        otherwise
            error('initializeFC:unknownAircraft', ...
                  'Unknown aircraft "%s".', aircraft);
    end

    %--------------------------------------
    % 2) Load per‐cell voltage data by FC type
    %--------------------------------------
    switch lower(fcType)
        case 'pem'
            % e.g. data/FC_PEM.mat contains variable 'voltage'
            data = load('data/FC1.mat', 'voltage','current_density');     

        case 'sofc'
            % e.g. data/FC_SOFC.mat contains variable 'voltage'
            data = load('data/FC.mat', 'voltage','current_density');

        case 'afc'
            % e.g. data/FC_AFC.mat contains variable 'voltage'
            data = load('data/FC.mat', 'voltage','current_density');

        otherwise
            error('initializeFC:unknownFCtype', ...
                  'Unknown FC type "%s".', fcType);
    end

    if ~isfield(data, 'voltage')
        error('initializeFC:missingVariable', ...
              'MAT-file for "%s" FC must contain variable ''voltage''.', fcType);
    end
    fc.voltage = data.voltage;  
    fc.currentdensity=data.current_density;
     %--------------------------------------
    % 3.5) Pick an operating point by power density
    %--------------------------------------
    %  – convert to A/cm^2
   % j_cm2 = fc.currentdensity/1e4;     % now in A/cm^2
                   % V
    
    %  – compute array of power densities [W/cm^2]
    pd    = fc.currentdensity .* fc.voltage;                

    %  – define your selection criterion (e.g. 80% of the peak)
    % target_pd = 1.0* max(pd);
    % [~, idx]  = max(pd);
    % % 
    % % %  – store the chosen operating point
    % % fc.j        = j_cm2(idx);
    % fc.V=fc.voltage(idx);
    fc.pd       = max(pd);
    [~,imax] = max(pd );
    fc.pd_bp = pd(1:imax);            % breakpoints (x): pd
    fc.j_tbl = fc.currentdensity(1:imax);             % table (y): j
    fc.U_tbl = fc.voltage(1:imax);             % optional: for Ucell(j) later
    fc.A_cells= fc.P_fc_max/fc.pd; %area of total active area of cells
         
 
    %fc.e_HHV=0.72/1.48; %V_cell_ref_HHV= 1.48V  ( 0.72 not sure)
    
     assignin('base', 'A_cells',   fc.A_cells);
     assignin('base', 'pd_bp',   fc.pd_bp);
    assignin('base', 'j_tbl',fc.j_tbl);
     assignin('base', 'U_tbl', fc.U_tbl);
    assignin('base', 'Vstack_required',   fc.Vstack);
    %assignin('base', 'numCells_required',fc.numCells);
     assignin('base', 'PowerDensity', fc.pd);
    %assignin('base','efficiency_HHV',fc.e_HHV);
    assignin('base', 'eta_C',    fc.eta_C);
    assignin('base', 'l_air',fc.l_air);
    assignin('base', 'cp_air', fc.cp_air);
    assignin('base','M_air',fc.M_air);
    assignin('base', 'h_C_air',fc.h_C_air);
    assignin('base', 'V0', fc.V0);
    assignin('base','R',fc.R);
    assignin('base','currentdensity',fc.currentdensity);
    assignin('base','voltage', fc.voltage);
    %assignin('base','T_stack',fc.T_stack);
    assignin('base', 'F',fc.F);
    assignin('base', 'HHV_H2', fc.HHV_H2);
    assignin('base','P_H2O',fc.P_H2O);
    assignin('base','p_stack',fc.p_stack);
     assignin('base', 'gamm', fc.g);
    assignin('base','eff_driver',fc.effi_driver);
    assignin('base','eff_isent',fc.effi_isent);
   

end