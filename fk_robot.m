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

x_base = 0;
y_base = 0;

% hedeflenen açı degeri
theta_1 = 45; 
theta_2 = 45; 

x_l1 = x_base + L1_length * cosd(theta_1);
y_l1 = y_base + L1_length * sind(theta_1);
x_l2 = x_l1 + L2_length * cosd(theta_2); 
y_l2 = y_l1 + L2_length * sind(theta_2); 


disp('Forward Kinematics Results:');
disp(['x_l1: ', num2str(x_l1)]);
disp(['y_l1: ', num2str(y_l1)]);
disp(['x_l2: ', num2str(x_l2)]);
disp(['y_l2: ', num2str(y_l2)]);

% Plot the links
hL1 = plot([x_base, x_l1], [y_base, y_l1], 'o-', 'LineWidth', 4);
hL2 = plot([x_l1, x_l2], [y_l1, y_l2], 'o-', 'LineWidth', 4);

legend('L1', 'L2');

hold off;
