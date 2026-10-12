function figs = plot_controller_comparison( ...
    results, t1, v1, error1, t2, v2, error2, v_ref)

    figs.velocity = plot_velocity_response(t1, v1, t2, v2, v_ref);

    figs.error = plot_tracking_error(t1, error1, t2, error2);

    figs.metrics = plot_performance_metrics(results);
end