function hand_track(t,X,x_end,y_end)
    l1 = 1;
    l2 = 1;
    location = zeros(length(t),2);
    for i=1:length(t)
        th1=X(i,1);
        th2=X(i,2);
        x1=l1*cos(th1);
        y1=l1*sin(th1);
        x2=x1+l2*cos(th2);
        y2=y1+l2*sin(th2);
        location(i,:)=[x2,y2];
    end
    plot(location(:,1),location(:,2))

    hold on
    x = linspace(0,x_end);
    y = linspace(0.01,y_end+0.01);
    plot(x,y)
    hold off