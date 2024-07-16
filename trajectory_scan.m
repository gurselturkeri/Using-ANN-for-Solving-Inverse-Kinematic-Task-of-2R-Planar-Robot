
%referans
%https://www.mathworks.com/help/symbolic/derive-and-apply-inverse-kinematics-to-robot-arm.html
 
xmin = 0;
xmax = 7;
ymin = 0;
ymax = 7;
ticks_frequency = 1;

figure;
hold on;

axis([xmin-1 xmax+1 ymin-1 ymax+1]);
axis equal;

plot([xmin-1 xmax+1], [0 0], 'k');
plot([0 0], [ymin-1 ymax+1], 'k');

xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14, 'Rotation', 0, 'HorizontalAlignment', 'right');

set(gca, 'XTick', xmin:ticks_frequency:xmax);
set(gca, 'YTick', ymin:ticks_frequency:ymax);
set(gca, 'XMinorTick', 'on');
set(gca, 'YMinorTick', 'on');
grid on;
set(gca, 'GridAlpha', 0.2, 'MinorGridAlpha', 0.2);

L1_length = 4; 
L2_length = 3; 

theta_1 = 0; 
theta_2 = 0; 


x_base = 0;
y_base = 0;


x_l1 = x_base + L1_length * cosd(theta_1);
y_l1 = y_base + L1_length * sind(theta_1);
x_l2 = x_l1 + L2_length * cosd(theta_2);
y_l2 = y_l1 + L2_length * sind(theta_2);

% Plot the lines
hL1 = plot([x_base, x_l1], [y_base, y_l1], 'o-', 'LineWidth', 4);
hL2 = plot([x_l1, x_l2], [y_l1, y_l2], 'o-', 'LineWidth', 4);


legend('L1', 'L2');

x_traj = [];
y_traj = [];
theta1_vals = [];
theta2_vals = [];

for t1 = 0:2:90
    for t2 = 0:2:90
        theta_1 = t1; 
        theta_2 = t2; 

        x_l1 = x_base + L1_length * cosd(theta_1);
        y_l1 = y_base + L1_length * sind(theta_1);
        x_l2 = x_l1 + L2_length * cosd(theta_2);
        y_l2 = y_l1 + L2_length * sind(theta_2);

        
        set(hL1, 'xdata', [x_base, x_l1], 'ydata', [y_base, y_l1]);
        set(hL2, 'xdata', [x_l1, x_l2], 'ydata', [y_l1, y_l2]);

        x_traj = [x_traj, x_l2];
        y_traj = [y_traj, y_l2];
        theta1_vals = [theta1_vals; theta_1];
        theta2_vals = [theta2_vals; theta_2];

        

        % plot the trajectory
        plot(x_traj, y_traj, 'r.','handlevisibility','off');

        data = [x_traj', y_traj'];
        data2 = [theta1_vals, theta2_vals];

        % https://www.mathworks.com/matlabcentral/answers/583043-how-can-we-write-data-into-csv-file-with-column-labels-included#answer_980050
        T = array2table(data);
        T.Properties.VariableNames(1:2) = {'x_traj','y_traj'}
        writetable(T,'data_in.csv')

        T2 = array2table(data2);
        T2.Properties.VariableNames(1:2) = {'theta1_vals', 'theta2_vals'}
        writetable(T2,'data_out.csv')

        pause(0.01);
    end
end


hold off;
