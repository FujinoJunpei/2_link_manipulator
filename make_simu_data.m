function make_simu_data(n_samples)

t = (0:0.04:10)';
len = size(t);
l = len(1);

xy_tau = zeros([n_samples*l,4]);

for k=1:n_samples
    P = ['sample:',num2str(k)];
    disp(P);
    x_end = 2;
    y_end = 2;
    while (x_end^2 + y_end^2 > 1)
        x_end = -1 + rand*2;
        y_end = -1 + rand*2;
    end

    open_system('solve_tau_block');
    in = Simulink.SimulationInput('solve_tau_block');
    u1 = x_end*ones(len);
    u2 = y_end*ones(len);
    in = in.setExternalInput([t,u1,u2]);
    out = sim(in);

    xy_tau((k-1)*l + 1:(k-1)*l + l, 1) = u1;
    xy_tau((k-1)*l + 1:(k-1)*l + l, 2) = u2;
    xy_tau((k-1)*l + 1:(k-1)*l + l, 3:4) = out.yout;
    writematrix(xy_tau, 'train_data.csv')

%    brain_tau_to_xy(out.yout,x_end,y_end)
end