function fig = plot_tracking_error(t_P, error_P, t_PI, error_PI)
%PLOT_TRACKING_ERROR Compare P and PI tracking errors.

    fig = figure('Name', 'Tracking Error');
    hold on;
    grid on;
    box on;

    plot(t_P, error_P, 'LineWidth', 1.5, ...
        'DisplayName', 'P controller');

    plot(t_PI, error_PI, 'LineWidth', 1.5, ...
        'DisplayName', 'PI controller');

    yline(0, '--k', 'Zero error');

    xlabel('Time (s)');
    ylabel('Tracking error (m/s)');
    title('Cruise Control: Tracking Error');
    legend('Location', 'best');

    hold off;
end