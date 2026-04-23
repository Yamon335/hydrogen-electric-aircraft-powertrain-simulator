function fp = getFlightProfile(profileName)
%GETFLIGHTPROFILE Return a single flight‐profile struct by name
%   fp = getFlightProfile('NZ2')
%   fp = getFlightProfile('NZ4')
%
%   Available names (case‐sensitive):
%     • 'NZ2'  → the NZ2 multi-phase profile
%     • 'NZ4'  → the NZ4 multi-phase profile

  switch profileName

    case 'NZ1'
      data = load('data/drivingcycle/HAPSS_missionprofile.mat', ...
                  'v','t','h','flight_phase','a','x','flap_setting','landing_gear');
      fp.description         = 'Multi-phase flight profile NZ1';
      fp.type                = 1;
      fp.v0                  = 91;    % m/s
      fp.h0                  = 0;              % m
      fp.FlightProfileHeight = max(data.h);   % m
      fp.FlightProfileLength = max(data.t);   % s
      fp.speed               = data.v*1.5;   % m/s
      fp.time                = data.t; %s
      fp.altitude            = data.h*1.5; %m
      fp.Phaseid             = data.flight_phase;
      fp.acceleration        = data.a; %m/s^2
      %fp.flightpathangle=data.fpa;

      fp.distance=data.x; %m
      fp.flap_setting=data.flap_setting; %degree
      fp.landing_gear=data.landing_gear;
       
       

    case 'NZ2'
      data = load('data/drivingcycle/HAPSS_missionprofile.mat', ...
                  'v','t','h','flight_phase','a','x','flap_setting','landing_gear');
      fp.description         = 'Multi-phase flight profile NZ2';
      fp.type                = 2;
      fp.v0                  = 91;    % m/s
      fp.h0                  = 0;              % m
      fp.FlightProfileHeight = max(data.h);   % m
      fp.FlightProfileLength = max(data.t);   % s
      fp.speed               = data.v*0.5;   % m/s
      fp.time                = data.t; %s
      fp.altitude            = data.h*0.5; %m
      fp.Phaseid             = data.flight_phase;
      fp.acceleration        = data.a; %m/s^2
      %fp.flightpathangle=data.fpa;

      fp.distance=data.x; %m
      fp.flap_setting=data.flap_setting; %degree
      fp.landing_gear=data.landing_gear;
       
       
     
        
      case 'HAPSS_MissionProfile'
      data = load('data/drivingcycle/HAPSS_missionprofile.mat', ...
                  'v','t','h','flight_phase','a','fpa','x','flap_setting','landing_gear');
      fp.description         = 'Multi-phase flight profile NZ4';
      fp.type                = 3;
      fp.v0                  = 91;    % m/s
      fp.h0                  = 0;              % m
      fp.FlightProfileHeight = max(data.h);   % m
      fp.FlightProfileLength = max(data.t);   % s
      fp.speed               = data.v;   % m/s
      fp.time                = data.t; %s
      fp.altitude            = data.h; %m
      fp.Phaseid             = data.flight_phase;
      fp.acceleration        = data.a; %m/s^2
      fp.flightpathangle=data.fpa;

      fp.distance=data.x; %m
      fp.flap_setting=data.flap_setting; %degree
      fp.landing_gear=data.landing_gear;
       
    otherwise
      error('getFlightProfile:InvalidName',...
            'Unknown profileName "%s". Valid names are: ''NZ2'', ''NZ4''.', ...
            profileName);
  end
end
