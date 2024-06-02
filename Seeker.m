function [R1,SIG1,GAM1,SIGR1] = Seeker(target_states,missile_states)
global VM1

xx = target_states(1)-missile_states(1);
yy = target_states(2)-missile_states(2);

R1 = sqrt(xx^2+yy^2);
SIG1 = atan2(yy,xx);
GAM1 = atan2(missile_states(4),missile_states(3));
SIGR1 = (0-VM1*sin(GAM1-SIG1))/R1;





