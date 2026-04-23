clear all; close all; clc;
warning('off','all');

% Define Simulink model name
sys_name = 'model6';
run("GUI.mlapp");
% Open the Simulink model
open_system(sys_name);

disp('Simulation setup is complete.'); 

PRESSURE0    = 101325.0;      
TEMPERATURE0 = 288.15;        
GRAV_CONST   = 9.80665;       
MOL_WT       = 28.9644;       
R_HAT        = 8314.32;       
GAMMA        = 1.4;           
R_air        = R_HAT / MOL_WT;
LAPSE_RATE   = -0.0065;  % K/m in the troposphere (0-11 km)

%%%%% Propeller Model%%%

load('data/Propeller.mat');
load('data/MASS_HAPSS_mission_Dash_8_H2_outputs');
p_speed=1212; % propeller speed rpm



% % % % % % EMS % % % % % % 

topology=1;
%phi_definition
%x = [phi_t, phi_to, phi_c, phi_cr, phi_d]; 
phi_topo1 = [0.2 0.2, 0.3, 0.0, 0.0,  0.0];       % Peak-only assist
phi_topo2 = [0.2 0.2, 0.2, 0.2, 0.2, 0.2];       % fixed split
phi_topo3 = [0.0 0.0, 0.0, 0.0, 0.0, 0.0];       % fuelcell-only
phi_topo4 = [1.0 1.0, 1.0, 1.0,  1.0, 1.0];       % Battery only


%%%%%Battery%%%%%
Ns= 200;  % number of battery cells in series
Np=200;   % number of battery cells in parallel
SOC_init=100; % percentage/100 % 

