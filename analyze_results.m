function results = analyze_results(Kp, Ki, Kd)
    run("parameters/input_parameters.m")

    [t, v, error] = run_simulation(Kp, Ki, Kd);
    
    % RMSE on the final 20% of simulated time
    rmse_cruise = sqrt(mean(error(t >= 0.8*t(end)).^2));
    
    % Time to achieve 95% of reference speed
    t_95 = t(find(v >= 0.95*v_ref, 1));
    
    % Maximal overshoot above reference speed
    overshoot = max(0, max(v) - v_ref);
    overshoot_rel = overshoot / v_ref;
    
    % Time to settle in permanent "cruise"
    cruise_gap = 0.02;
    unsettled_idx = find(abs(v - v_ref) > cruise_gap * v_ref);
    
    if isempty(unsettled_idx)
        t_settle = 0;
    elseif unsettled_idx(end) < length(v)
        t_settle = t(unsettled_idx(end) + 1);
    else
        t_settle = NaN;
    end
    
    % Print output
    fprintf("RMSE (cruise):       %.3f m/s\n", rmse_cruise);
    fprintf("Time to 95%%:         %.3f s\n", t_95);
    fprintf("Overshoot:           %.3f m/s (%.2f%%)\n", ...
        overshoot, overshoot_rel * 100);
    fprintf("Settling time:       %.3f s\n", t_settle);
    
    % Results collection
    results.rmse_cruise = rmse_cruise;
    results.t_95 = t_95;
    results.overshoot = overshoot;
    results.overshoot_rel = overshoot_rel;
    results.t_settle = t_settle;