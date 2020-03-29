function make_grid_data(grid)

    n_samples = grid*grid;
    t = (0:0.04:10)';
    len = size(t);
    l = len(1);

    xy_tau = zeros([n_samples*l,4]);
    
    for k=1:n_samples 
        P = ['sample:',num2str(k)];
        disp(P);

        [q, r] = quorem(sym(k), sym(grid));
        r = double(r);
        if (r == 0)
            r = grid;
            q = double(q);
        else
            q = double(q) + 1; 
        end

        x_end = -1 + (2/grid)*r - 1/grid;
        y_end = 1 - (2/grid)*q + 1/grid;

        if (x_end^2 + y_end^2 <= 1)
            open_system('solve_tau_block');
            in = Simulink.SimulationInput('solve_tau_block');
            u1 = x_end*ones(len);
            u2 = y_end*ones(len);
            in = in.setExternalInput([t,u1,u2]);
            out = sim(in);
        
            xy_tau((k-1)*l + 1:(k-1)*l + l, 1) = u1;
            xy_tau((k-1)*l + 1:(k-1)*l + l, 2) = u2;
            xy_tau((k-1)*l + 1:(k-1)*l + l, 3:4) = out.yout; 
        
            % brain_tau_to_xy(out.yout,x_end,y_end)
        end
    end

    writematrix(xy_tau, 'grid_data.csv') %非ゼロだけの行列にしたい...