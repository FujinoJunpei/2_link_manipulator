clc
clear all
close all

t = (0:0.001:10)';
len = size(t);

x_end = 2;
y_end = 2;
while (x_end^2 + (y_end + 0.01)^2 > 4)
    x_end = -2 + rand*4;
    y_end = -2 + rand*4 - 0.01;
end

open_system('output_X');
in = Simulink.SimulationInput('output_X');
u1 = x_end*ones(len);
u2 = y_end*ones(len);
in = in.setExternalInput([t,u1,u2]);
out = sim(in);

hand_track(out.tout,out.yout,x_end,y_end)