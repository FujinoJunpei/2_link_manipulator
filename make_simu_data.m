function make_simu_data(n_samples);

t = (0:0.001:10)';
len = size(t);

xy_tau = zeros([n_samples*len,4]);

for k=1:n_samples

    x_end = 2;
    y_end = 2;
    while (x_end^2 + (y_end + 0.01)^2 > 4)% | (abs(x_end) < 0.6)
        x_end = -2 + rand*4;
        y_end = -2 + rand*4 - 0.01;
    end

    open_system('solve_tau_block');
    in = Simulink.SimulationInput('solve_tau_block');
    u1 = x_end*ones(len);
    u2 = y_end*ones(len);
    in = in.setExternalInput([t,u1,u2]);
    out = sim(in);

    xy_tau((k-1)*len + 1:(k-1)*len + len, 1) = [t*x_end/10];
    xy_tau((k-1)*len + 1:(k-1)*len + len, 2) = [0.01 + t*y_end/10];
    xy_tau((k-1)*len + 1:(k-1)*len + len, 3:4) = out.yout;
    writematrix(xy_tau, 'train_data.csv')

%    brain_tau_to_xy(out.yout,x_end,y_end);
end