%/////////////////////////////////////////////////////////////////////////%
%                                                                         %
%   - Name : Main.m                                                       %
%                                                                         %
%                   - Created by Lee, H. I.    28. 01. 2022.              %
%                                                                         %
%/////////////////////////////////////////////////////////////////////////%

%.. Matlab Initialise 
    clear all; clc; warning off; 

%.. Simulation Initialise
    Sim_Parameters;
    missile_states = [MX10 MY10 VMX10 VMY10 0 0 GAM_M10];
    target_states  = [TX0 TY0];
    time = 0;
    A_M = 0;
for t = 0:DT:10
    %.. Seeker
        [R1,SIG1,GAM1,SIGR1] = Seeker(target_states,missile_states(end,:));
    %.. Guidance Law
        AM = Guidance(R1, SIG1, GAM1, SIGR1);
    %.. Missile Dynamics
        missile_states_update = Dynamics(missile_states(end,:),AM);
        missile_states = [missile_states;missile_states_update];
        time = [time;t];
        A_M = [A_M;AM];
    %.. Simulation End
        if R1 <=0.05
            break;
        end
end
%.. Plot
% design your own codes to plot the results


%% for B-3
% AM = -sqrt(missile_states(:,5).^2+missile_states(:,6).^2);
%% for B-4
% for 0
% AM1 = -sqrt(missile_states(1:1342,5).^2+missile_states(1:1342,6).^2);
% AM2 = sqrt(missile_states(1343:2014,5).^2+missile_states(1343:2014,6).^2);

% for -45
% AM1 = sqrt(missile_states(1:138,5).^2+missile_states(1:138,6).^2);
% AM2 = -sqrt(missile_states(139:2100,5).^2+missile_states(139:2100,6).^2);

% for 90
% AM1 = sqrt(missile_states(1:500,5).^2+missile_states(1:500,6).^2);
% AM2 = -sqrt(missile_states(501:1632,5).^2+missile_states(501:1632,6).^2);
%% for B-5
%for 0
% AM1 = -sqrt(missile_states(1:804,5).^2+missile_states(1:804,6).^2);
% AM2 = sqrt(missile_states(805:2005,5).^2+missile_states(805:2005,6).^2);

%for -45
% AM1 = sqrt(missile_states(1:527,5).^2+missile_states(1:527,6).^2);
% AM2 = -sqrt(missile_states(528:2341,5).^2+missile_states(528:2341,6).^2);

%for -90
% AM1 = sqrt(missile_states(1:62,5).^2+missile_states(1:62,6).^2);
% AM2 = -sqrt(missile_states(63:1767,5).^2+missile_states(63:1767,6).^2);

%% plots
% AM = [AM1;AM2];

figure;
plot(missile_states(:,1),missile_states(:,2));
xlabel('X (m)');
ylabel('Y (m)');
title('Trajectory');


figure;
plot(time,A_M);
xlabel('Time (s)');
ylabel('AM (g)');
title('Guidance Commands');



