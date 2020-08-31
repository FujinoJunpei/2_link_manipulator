pre_el = readmatrix("prediction_el_xy.csv");
pre_han = readmatrix("prediction_xy.csv");
ans_el = readmatrix("ans_el_xy.csv");
ans_han = readmatrix("ans_xy.csv");

h = figure;
% axis tight manual % this ensures that getframe() returns a consistent size
filename = '2_link_manipulator.gif';
s = 13;
for n = 1:s:251
    % line([0 pre_el(n,1)], [0 pre_el(n,2)])
    % Draw plot for y = x.^n
    x = linspace(0,pre_el(n,1));
    y = linspace(0,pre_el(n,2));
    plot(x,y,"-","Color",'#1E90FF',"LineWidth",5)
    xlim([0 2])
    ylim([-1 1])

    hold on

    x = linspace(pre_el(n,1),pre_han(n,1));
    y = linspace(pre_el(n,2),pre_han(n,2));
    plot(x,y,"-","Color",'#1E90FF',"LineWidth",5)

    for k = 1:s:n-s
        x = linspace(pre_han(k,1),pre_han(k+s,1));
        y = linspace(pre_han(k,2),pre_han(k+s,2));
        plot(x,y,"-r")
    end

    % x = linspace(1,ans_han(251,1));
    % y = linspace(0,ans_han(251,2));
    % plot(x,y,"-g")

    plot(ans_han(end,1),ans_han(end,2),'p',"MarkerEdgeColor",'#EDB120',"MarkerFaceColor",'#EDB120',"MarkerSize",15)

    plot(pre_el(n,1),pre_el(n,2),'o',"MarkerEdgeColor",'#3CB371',"MarkerFaceColor",'#3CB371',"MarkerSize",15)
    plot(pre_han(n,1),pre_han(n,2),'o',"MarkerEdgeColor",'#3CB371',"MarkerFaceColor",'#3CB371',"MarkerSize",15)

    hold off

    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,"DelayTime",0);
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append',"DelayTime",0); 
      end 
  end