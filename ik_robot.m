xmin = 0;
xmax = 8;
ymin = 0;
ymax = 8;
ticks_frequency = 1;


% ACILARI BULDUĞUNDA ACILAR 0DAN BASLAYIP BELIRTILEN HEDEFE GİDECEK

syms theta_1 theta_2 x_base y_base L1_length L2_length x_l2 y_l2




figure;
hold on;



axis([xmin-1 xmax+1 ymin-1 ymax+1]);
axis equal;

plot([xmin-1 xmax+1], [0 0], 'k','handlevisibility','off');
plot([0 0], [ymin-1 ymax+1], 'k','handlevisibility','off');

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

x_l1 = x_base + L1_length * cosd(theta_1);
y_l1 = y_base + L1_length * sind(theta_1);
x_l2 = x_l1 + L2_length * cosd(theta_2); 
y_l2 = y_l1 + L2_length * sind(theta_2); 



desired_x = 0; 
desired_y = 7; 


[theta_1_sol, theta_2_sol] = solve([x_l2 == desired_x, y_l2 == desired_y], [theta_1, theta_2]);


theta_1_num = double(theta_1_sol(1));
theta_2_num = double(theta_2_sol(1));

disp(theta_1_num);
disp(theta_2_num);

x_l1_num = double(x_base + L1_length * cosd(theta_1_num));
y_l1_num = double(y_base + L1_length * sind(theta_1_num));
x_l2_num = double(x_l1_num + L2_length * cosd(theta_2_num));
y_l2_num = double(y_l1_num + L2_length * sind(theta_2_num));

theta = linspace(0, 2*pi, 180);
inner_radius = abs(L1_length - L2_length);
outer_radius = L1_length + L2_length;

% Inner boundary
x_inner = inner_radius * cos(theta);
y_inner = inner_radius * sin(theta);

% Outer boundary
x_outer = outer_radius * cos(theta);
y_outer = outer_radius * sin(theta);

plot(x_inner, y_inner, 'r--', 'DisplayName', 'Inner Boundary');
plot(x_outer, y_outer, 'g--', 'DisplayName', 'Outer Boundary');



hL1 = plot([x_base, x_l1_num], [y_base, y_l1_num], 'o-', 'LineWidth', 3.5,'DisplayName','L1 length');
hL2 = plot([x_l1_num, x_l2_num], [y_l1_num, y_l2_num], 'o-', 'LineWidth', 3.5,'DisplayName','L2 length');
p = plot(desired_x,desired_y,'--bs', 'LineWidth', 4,'DisplayName', 'desired point');

legend

hold off;
