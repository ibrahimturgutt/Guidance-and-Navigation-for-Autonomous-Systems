function AM = Guidance(R1, SIG1, GAM1, SIGR1)
global GAMD VM1 d2r

%.. Guidance Law

    % Parameters
    Tgo = R1/VM1;
% 
%     y = VM1*Tgo*(GAMD-SIG1);
% 
%     v = VM1*(GAM1-GAMD);
%     % Guidance Command
%     AM = -(3/(Tgo^2))*(y+v*Tgo);

   %% ------------ B4 --------------    
v = VM1*(GAM1-GAMD);
y = VM1*Tgo*(GAMD-SIG1);
AM = -(6/(Tgo^2))*y-(4/(Tgo))*v;
   
%% ------------ B5 --------------

% v = VM1*(GAM1-GAMD(1));
% y = VM1*Tgo*(GAMD(1)-SIG1);
% a = 2;
% k1 = (a+2)*(a+3);
% k2 = 2*(a+2);
% 
% AM = (-k1*(y/Tgo^2))-k2*(v/Tgo);
end

