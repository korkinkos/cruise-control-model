function fig = plot_velocity_response(t_P, v_P, t_PI, v_PI, v_ref)
%PLOT_VELOCITY_RESPONSE Compare P and PI velocity responses.

    fig = figure('Name', 'Velocity Response');
    hold on;
    grid on;
    box on;

    plot(t_P, v_P, 'LineWidth', 1.5, ...
        'DisplayName', 'P controller');

    plot(t_PI, v_PI, 'LineWidth', 1.5, ...
        'DisplayName', 'PI controller');

    yline(v_ref, '--k', 'Reference speed');

    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    title('Cruise Control: Velocity Response');
    legend('Location', 'best');

    hold off;
end