import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator


def corr_GIVEN_a_lag(x, y, lag_k):
    x_len = len(x)
    y_len = len(y)
    m_lower_bound = max(0, lag_k)
    m_upper_bound = min(x_len - 1, y_len + lag_k - 1)
    corr_GIVEN_lag_k = 0
    for m in range(m_lower_bound, m_upper_bound+1):
        corr_GIVEN_lag_k = corr_GIVEN_lag_k + x[m].conj() * y[m-lag_k]
    return corr_GIVEN_lag_k


def corr_ALL_lags(x, y):
    x_len = len(x)
    y_len = len(y)
    corrs = np.zeros(x_len + y_len + 1)
    lag_upper_bound = x_len
    lag_lower_bound = - y_len
    lags = [lag for lag in range(lag_lower_bound, lag_upper_bound+1)]
    for k in range(len(lags)):
        lag_k = lags[k]
        corrs[k] = corr_GIVEN_a_lag(x, y, lag_k)
    corr_at_all_lag_positions = corrs
    return corr_at_all_lag_positions, lags


""" Define 2 sequences and find their cross-corr. values """
x = np.array([1.2, 0.7, -0.6, 1.4, -1.1, 0.3, 1.8, -0.2, 1.2])
y = np.array([0.5, 2.2, 0.7, 1, -0.3, 1.4, 1.5, 0.1, -0.8, -1.1])

[corrs, lags] = corr_ALL_lags(x, y)

""" Compare the results """
ax = plt.figure().gca()
plt.plot(lags, corrs, '--bo',
         markerfacecolor='none', label='My function')
plt.xlim((-10, 10))
plt.ylim((-2, 6))
plt.xlabel('Lag', fontsize=12)
plt.ylabel('Cross--correlation', fontsize=12)
plt.legend(loc='best')
plt.grid()
ax.xaxis.set_major_locator(MaxNLocator(integer=True))
