pre_el = readmatrix("prediction_el_xy.csv");
pre_han = readmatrix("prediction_xy.csv");
ans_el = readmatrix("ans_el_xy.csv");
ans_han = readmatrix("ans_xy.csv");

h = figure;
% axis tight manual % this ensures that getframe() returns a consistent size
filename = '2_link_manipulator_ans.gif';
s = 13;
for n = 1:s:251
    % line([0 pre_el(n,1)], [0 pre_el(n,2)])
    % Draw plot for y = x.^n
    x = linspace(0,ans_el(n,1));
    y = linspace(0,ans_el(n,2));
    plot(x,y,"-b","LineWidth",5)
    xlim([0 2])
    ylim([-1 1])

    hold on

    x = linspace(ans_el(n,1),ans_han(n,1));
    y = linspace(ans_el(n,2),ans_han(n,2));
    plot(x,y,"-b","LineWidth",5)

    for k = 1:s:n-s
        x = linspace(ans_han(k,1),ans_han(k+s,1));
        y = linspace(ans_han(k,2),ans_han(k+s,2));
        plot(x,y,"-r")
    end

    plot(ans_han(end,1),ans_han(end,2),'*',"MarkerEdgeColor",'c',"MarkerFaceColor",'c',"MarkerSize",15)

    plot(ans_el(n,1),ans_el(n,2),'o',"MarkerEdgeColor",'c',"MarkerFaceColor",'c',"MarkerSize",15)
    plot(ans_han(n,1),ans_han(n,2),'o',"MarkerEdgeColor",'r',"MarkerFaceColor",'r',"MarkerSize",15)

    hold off

    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,"DelayTime",0,"ScreenSize",[400 400]);
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append',"DelayTime",0,"ScreenSize",[400 400]); 
      end 
  end