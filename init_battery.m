function batt = init_battery(batterytype)
%GETFLIGHTPROFILE Return a single flight‐profile struct by name
%   fp = getFlightProfile('NZ2')
%   fp = getFlightProfile('NZ4')
%
%   Available names (case‐sensitive):
%     • 'NZ2'  → the NZ2 multi-phase profile
%     • 'NZ4'  → the NZ4 multi-phase profile

  switch batterytype

    case 'Toriyama'
      data = load('data/Toriyama_battery.mat');
      batt.description         = 'Toriyama Battery Cell';
      batt.type                = 'Lithium Ion';
      batt.OCV=data.OCV;
      batt.R_discharge = data.R_discharge;
      batt.R_charge=data.R_charge;
      batt.SOC=data.SOC;
      batt.Capacity_Ah=data.Capacit_Ah;
      batt.nominal_V=data.nominal_V;
      batt.maxi_V=data.maxi_V;
      batt.weight_g=data.weight_g;
      batt.maxipulse_dischargecurrent=data.maxipulse_dischargecurrent;
      batt.continuous_dischargecurrent=data.continuous_dischargecurrent;
      batt.cuttoff_V=data.cuttoff_V;

    case 'Toriyama2'
      data = load('data/Toriyama_battery.mat');
      batt.description         = 'Toriyama Battery Cell';
      batt.type                = 'Lithium Ion2';
      batt.OCV=data.OCV;
      batt.R_discharge = data.R_discharge;
      batt.R_charge=data.R_charge;
      batt.SOC=data.SOC;
      batt.Capacity_Ah=data.Capacit_Ah;
      batt.nominal_V=data.nominal_V;
      batt.maxi_V=data.maxi_V;
      batt.weight_g=data.weight_g;
      batt.maxipulse_dischargecurrent=data.maxipulse_dischargecurrent;
      batt.continuous_dischargecurrent=data.continuous_dischargecurrent;
      batt.cuttoff_V=data.cuttoff_V;


     case 'Panasonic'
      data = load('data/Toriyama_battery.mat');
      batt.description         = 'PANASONIC Battery Cell';
      batt.type                = 'Lithium Ion3';
      batt.OCV=data.OCV;
      batt.R_discharge = data.R_discharge;
      batt.R_charge=data.R_charge;
      batt.SOC=data.SOC;
      batt.Capacity_Ah=data.Capacit_Ah;
      batt.nominal_V=data.nominal_V;
      batt.maxi_V=data.maxi_V;
      batt.weight_g=data.weight_g;
      batt.maxipulse_dischargecurrent=data.maxipulse_dischargecurrent;
      batt.continuous_dischargecurrent=data.continuous_dischargecurrent;
      batt.cuttoff_V=data.cuttoff_V;

  end