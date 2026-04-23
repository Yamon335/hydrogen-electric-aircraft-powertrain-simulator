function as = initializeaircraft(aircraft)

  switch aircraft
% % % % % % AIRCRAFT SPECIFICATIONS MODEL 311 HAPSS AIRCRAFT% % % % % % % % % % % 
      case 'HAPSS'
     as.type='30 seater retrofitted aircraft_Dash 8-300'; 
     as.propeller= 'Hamilton Standard 14SF-15';
     as.trueairspeed=130; %m/s
     as.m0=15622; % Operational empty mass in kg
     as.payloadmass=3089;%design payload mass in kg
     as.m1=19051; %maximum takeoff in kg
     as.m2=19051; %maximum landing mass in kg
     as.Sw=56.3; %wing area in m^2
     as.Bw=27.4; % wing span in meter
     as.Bp=4; %No of propeller blades
     as.Dp=3.96; % propeller diameter
     as.g=9.81;

      case 'AirBus A320 neo'
     as.type='100 seater electric aircraft';
     as.propeller='Distributed Propeller';
     as.trueairspeed=200; %m/s
     as.m0=42600; % Operational empty mass in kg
     as.payloadmass=18000;%design payload mass in kg
     as.m1=78000; %maximum takeoff/landing mass in kg
     as.m2=66000; %maximum landing mass in kg
     as.Sw=122.3; %wing area in m^2
     as.Bw=35.8; % wing span in meter
     as.Bp=4; %No of propeller blades
     as.Dp=3.96; % propeller diameter
     as.g=9.81;
      
      case 'ATR72-600'
     as.type='70 seater Twin-Engine turbopop regional';
     as.propeller='6-blade Hamilton Standard composite propellers';
     as.trueairspeed=140; %m/s
     as.m0=13000; % Operational empty mass in kg
     as.payloadmass=7500;%design payload mass in kg
     as.m1=23000; %maximum takeoff/landing mass in kg
     as.m2=22000; %maximum landing mass in kg
     as.Sw=61.0; %wing area in m^2
     as.Bw=27.5; % wing span in meter
     as.Bp=6; %No of propeller blades
     as.Dp=3.93; % propeller diameter
     as.g=9.81;

      case 'pipstrel velis'
      as.type='Two seater short duration training flight';
      as.propeller='Pipistrel P-812-164-F3A, 3-blade fixed-pitch composite';
      as.trueairspeed=47; %m/s
     as.m0=428; % Operational empty mass in kg
     as.payloadmass=172;%design payload mass in kg
     as.m1=600; %maximum takeoff/landing mass in kg
     as.m2=600; %maximum landing mass in kg
     as.Sw=9.51; %wing area in m^2
     as.Bw=10.71; % wing span in meter
     as.Bp=3; %No of propeller blades
     as.Dp=1.64; % propeller diameter
     as.g=9.81;

     otherwise
      error('initializeaircraft:unknownType', ...
            'Unknown aircraft type "%s".  Valid options are: HAPSS, AirBus A320 neo, ATR72-600, pipstrel velis.', ...
            aircraft);
  end
  % % % % % %Aerodynamic System% % % % % % % % % % % 
  %as.  cd0=0.0322 ; %zero lift drag coefficient_clean
  %as.  k0_clean=0.0372; % Lift- induced Drage Coefficient_clean
  as. rud_deflec=0.28;%rudder deflection in radians
 % as.cd0_tof=0.0422;
 % as.cd0_tofLG=0.0572;
  %as.k0_tof=0.0403;
  %as.k0_tofLG=0.0403;
 
  as.cL0=0.12; %lift coefficient at zero angle of attack
  as.mu=0.03;
  %% aerodynamic coefficient%%%
as.cL_1 = 0.4023;
as.cL_2= 0.12;
as.cL_3=1.0598;
  %%%%%


            assignin('base','trueairspeed',   as.trueairspeed);
            assignin('base','m0',             as.m0);
            assignin('base','payloadmass',    as.payloadmass);
            assignin('base','m1',             as.m1);
            assignin('base','m2',             as.m2);
            assignin('base','Sw',             as.Sw);
            assignin('base','Bw',             as.Bw);
            assignin('base','Bp',             as.Bp);
            assignin('base','Dp',             as.Dp);
            assignin('base','g',              as.g);
            %assignin('base','cd0',   as.cd0);
           % assignin('base','k0',             as.k0);
            assignin('base','rud_deflec',    as.rud_deflec);
            %assignin('base','cd_flaps_LG',             as.cd_flaps_LG);
            %assignin('base','k_flaps_LG',             as.k_flaps_LG);
            assignin('base','cL0',             as.cL0);
            assignin('base','mu',             as.mu);
            assignin('base','cL_1',             as.cL_1);
            assignin('base','cL_2',             as.cL_2);
            assignin('base','cL_3',             as.cL_3);
  end
 
      
      