clear all; clc;

t_x = [-4,  -3,  -2,   -1,   0,   1,   2,    3,   4];
x   = [1.2, 0.7, -0.6, 1.4, -1.1, 0.3, 1.8, -0.2, 1.2];

t_y = [-1,  0,   1,   2,   3,   4,   5,   6,   7,    8, ];
y   = [0.5, 2.2, 0.7, 1, -0.3, 1.4, 1.5, 0.1, -0.8, -1.1];

figure(1)
extra_specs = {'Interpreter','latex', 'fontsize', 13.5};
sgtitle('Sequences $x(t)$ and $y(t)$', extra_specs{:})
ax1 = subplot(2,1,1);
stem(t_x, x, 'b--o', 'LineWidth', 1.2)
xlabel('$t$', extra_specs{:})
ylabel('$x(t)$', extra_specs{:})
hold on
ax2 = subplot(2,1,2);
stem(t_y, y, 'r-*', 'LineWidth', 1)
xlabel('$t$', extra_specs{:})
ylabel('$y(t)$', extra_specs{:})
linkaxes([ax1 ax2],'xy')

%% Show x and y versus the array index
% NOTE: An array in Matlab starts with the index = 1

figure(2)
sgtitle('Arrays $x(m)$ and $y(m)$', extra_specs{:})
ax1 = subplot(2,1,1);
stem(x, 'b--o', 'LineWidth', 1.2)
xlabel('Index $m$ of an array (starting with $m=1$ in Matlab)', extra_specs{:})
ylabel('$x(m)$', extra_specs{:})
hold on
ax2 = subplot(2,1,2);
stem(y, 'r-*', 'LineWidth', 1)
xlabel('Index $m$ of an array (starting with $m=1$ in Matlab)', extra_specs{:})
ylabel('$y(m)$', extra_specs{:})
linkaxes([ax1 ax2],'xy')


t_xm = [1,   2,    3,    4,    5,   6,   7,    8,   9];
xm   = [1.2, 0.7, -0.6, 1.4, -1.1, 0.3, 1.8, -0.2, 1.2];

% Shift y(m) to the left 10 positions so that the last element ...
% ... in y_shifted(m) = y(m+10) is deviated 1 position to the 1st element of x(m)
t_ym_LEFT = [-9,  -8,  -7,  -6,  -5,   -4,   -3,   -2,   -1,     0];
ym_LEFT   = [0.5, 2.2, 0.7,  1, -0.3,  1.4,  1.5,  0.1, -0.8,  -1.1];

% Shift y(m) to the right 9 positions so that the 1st element ...
% ... in y_shifted(m) = y(m-9) is deviated 1 position to the last element of x(m)
t_ym_RIGHT = [10,  11,  12,   13,   14,   15,  16,   17,   18,    19];
ym_RIGHT   = [0.5, 2.2, 0.7,  1,  -0.3,  1.4,  1.5,  0.1, -0.8,  -1.1];


figure(3)
extra_specs = {'Interpreter','latex', 'fontsize', 15};
sgtitle('$x(m)$, $y(m+10)$ and $y(m-9)$, given length(y)=10 and length(x)=9', 'Interpreter','latex', 'fontsize', 12)
ax1 = subplot(3,1,1);
stem(t_xm, xm, 'b--o', 'LineWidth', 1.2)
xlabel('$m$', extra_specs{:})
ylabel('$x(m)$', extra_specs{:})
hold on
ax2 = subplot(3,1,2);
stem(t_ym_LEFT, ym_LEFT, 'r-*', 'LineWidth', 1)
xlabel('$m$', extra_specs{:})
ylabel('$y(m+10)$', extra_specs{:})
legend('$y(m+10) \Leftrightarrow y(m)$ is shifted 10 positions to the left', ...
       'Location','northeast', 'Interpreter','latex', 'fontsize', 11)
ax3 = subplot(3,1,3);
stem(t_ym_RIGHT, ym_RIGHT, 'r-*', 'LineWidth', 1)
xlabel('$m$', extra_specs{:})
ylabel('$y(m-9)$', extra_specs{:})
legend('$y(m-9) \Leftrightarrow y(m)$ is shifted 9 positions to the right', ...
       'Location','southwest', 'Interpreter','latex', 'fontsize', 11)
linkaxes([ax1 ax2 ax3],'xy')