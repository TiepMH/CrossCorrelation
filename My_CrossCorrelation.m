%% This example demonstrates how to build a cross-corr. function without using Matlab's xcorr function
clear all; clc;

x   = [1.2, 0.7, -0.6, 1.4, -1.1, 0.3, 1.8, -0.2, 1.2];
y   = [0.5, 2.2, 0.7, 1, -0.3, 1.4, 1.5, 0.1, -0.8, -1.1];

%% Using my function
[corrs, lags] = corr_ALL_lags(x, y);

%% Using the Matlab built-in function
[corr_builtIn, lag_builtIn] = xcorr(x, y);

%% Compare the results
figure()
sgtitle("Compare my function to Matlab's xcorr", 'fontsize', 15)
plot(lag_builtIn, corr_builtIn, 'rx', 'LineWidth', 1.4, 'MarkerSize', 16)
hold on
plot(lags, corrs, '--bo', 'LineWidth', 1.4)
grid on
xlabel('Lag', 'fontsize', 12)
ylabel('Cross--correlation', 'fontsize', 12)
legend("Matlab's built-in function xcorr", "My function", ...
      'fontsize', 10, 'Location', 'southeast')

%% Local functions
function corr_GIVEN_lag_k = corr_GIVEN_a_lag(x,y,lag_k)
%Given the k-th lag, we calculate the cross-correlation
%
%                       c(lag_k) = sum_m  x(m) * y(m-lag_k)
%
% If lag_k > 0, then y shifts to the right.
% If lag_k < 0, then y shifts to the left.
% NOTE: the index of the 1st element in a Matlab array is 1. 
% In another language, such as Python, the index of the 1st element in an array is 0.
% It is important to find the range of m in the loop ''for m=m_lower_bound:m_upper_bound''
    x_len = length(x);
    y_len = length(y);
    m_lower_bound = max(1, 1 + lag_k);
    m_upper_bound = min(x_len, y_len + lag_k);
    corr_GIVEN_lag_k = 0;
    for m=m_lower_bound:m_upper_bound
        corr_GIVEN_lag_k = corr_GIVEN_lag_k + x(m)' * y(m - lag_k);
    end
end

function [corr_at_all_lag_positions, lags] = corr_ALL_lags(x,y)
    x_len = length(x);
    y_len = length(y);
    corrs = zeros(1, x_len + y_len + 1);
    % Let y_first be the 1st element in y(m).
    % Let y_last be the last element in y(m).
    %% if we shift y(m) to the right, y_first passes x(m) after x_len steps
    lag_upper_bound = x_len;
    %% if we shift y(m) to the left, y_last passes x(m) after y_len steps
    lag_lower_bound = - y_len;
    %% The range of lag should be -y_len <= lag <= x_len
    lags = lag_lower_bound:lag_upper_bound;
    %% calculate the value of cross-corr. for each specific lag
    for i=1:length(lags)
        lag_k = lags(i);
        corrs(i) = corr_GIVEN_a_lag(x,y,lag_k);
    end
    corr_at_all_lag_positions = corrs;
end