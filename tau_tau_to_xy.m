function tau_tau_to_xy(tau1,tau2)

open_system('tau_simu_to_xy');
in = Simulink.SimulationInput('tau_simu_to_xy');
t = linspace(0,10,length(tau1))';
u1 = tau1(:,1);
u2 = tau1(:,2);
in = in.setExternalInput([t,u1,u2]);
out1 = sim(in);

open_system('tau_simu_to_xy');
in = Simulink.SimulationInput('tau_simu_to_xy');
t = linspace(0,10,length(tau2))';
u1 = tau2(:,1);
u2 = tau2(:,2);
in = in.setExternalInput([t,u1,u2]);
out2 = sim(in);

hand_track_tau_tau(out1.tout,out1.yout,out2.tout,out2.yout);