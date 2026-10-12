% Simulate P-only controller
[t_P, v_P, error_P] = run_simulation(100, 0, 0);

% Simulate PI controller
[t_PI, v_PI, error_PI] = run_simulation(100, 10, 0);

% Generate all comparison plots
figs = plot_controller_comparison( ...
    results, t_P, v_P, error_P, ...
    t_PI, v_PI, error_PI, v_ref);