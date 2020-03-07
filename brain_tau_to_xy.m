function brain_tau_to_xy(tau,x_end,y_end);

open_system('tau_simu_to_xy');
in = Simulink.SimulationInput('tau_simu_to_xy');
t = (0:0.001:10)';
u1 = tau(:,1);
u2 = tau(:,2);
in = in.setExternalInput([t,u1,u2]);
out = sim(in);

hand_track(out.tout,out.yout,x_end,y_end);