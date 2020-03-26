function hand_track_tau_tau(t1,X1,t2,X2)
    l1 = 1;
    l2 = 1;
    location1 = zeros(length(t1),2);
    for i=1:length(t1)
        th1=X1(i,1);
        th2=X1(i,2);
        x1=l1*cos(th1);
        y1=l1*sin(th1);
        x2=x1+l2*cos(th2);
        y2=y1+l2*sin(th2);
        location1(i,:)=[x2,y2];
    end

    location2 = zeros(length(t2),2);
    for i=1:length(t2)
    th1=X2(i,1);
    th2=X2(i,2);
    x1=l1*cos(th1);
    y1=l1*sin(th1);
    x2=x1+l2*cos(th2);
    y2=y1+l2*sin(th2);
    location2(i,:)=[x2,y2];
    end
    
    plot(location1(:,1),location1(:,2))
    xlim([0 2])
    ylim([-1 1])
    
    hold on
    plot(location2(:,1),location2(:,2))
    hold off