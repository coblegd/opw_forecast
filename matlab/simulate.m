rng(1234);

% Model Parameters
lag = 1;
delta = 3;
sigma2 = 10;

% Cache storage
cache = struct;

% Data
[endog, exog] = get_data(lag, delta);

% Parameters
G0 = 20000;
G = 20000;

tic();  % timing

% Iterate
[ys, gammas, rhos, accepts] = mh(exog, endog, G0, G, sigma2, cache);

elapsed = toc();  % timing

minutes = fix(elapsed / 60);
seconds = mod(elapsed, 60);
disp(['Runtime of ', num2str(minutes), ' minutes and ', num2str(seconds), ' seconds'])
disp(['Number of draws to convergence: ', num2str(G0)])
disp(['Number of draws after convergence: ', num2str(G)])
disp(['Prior VC matrix for model parameters is: ', num2str(sigma2)])
disp(['Average Model Size: ', num2str(mean(sum(gammas, 1)))])
