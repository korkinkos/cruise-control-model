
function figs = plot_performance_metrics(results)
%PLOT_PERFORMANCE_METRICS Plot metrics from a struct array of results.
%
% Expected fields:
%   Kp, Ki, Kd, rmse_cruise, overshoot_rel, t_settle

    % Extract gain values from the struct array.
    Kp = [results.Kp];
    Ki = [results.Ki];
    Kd = [results.Kd];

    % Find unique Ki/Kd combinations.
    gain_combinations = unique([Ki(:), Kd(:)], 'rows');

    metric_names = {'rmse_cruise', 'overshoot_rel', 't_settle'};
    y_labels = {'Cruise RMSE (m/s)', ...
                'Relative overshoot (%)', ...
                'Settling time (s)'};
    titles = {'Cruise Tracking Accuracy', ...
              'Transient Overshoot', ...
              'Settling Performance'};

    figs = gobjects(3, 1);

    for p = 1:3
        figs(p) = figure('Name', titles{p});
        hold on;
        grid on;
        box on;

        for i = 1:size(gain_combinations, 1)
            ki_value = gain_combinations(i, 1);
            kd_value = gain_combinations(i, 2);

            idx = (Ki == ki_value) & (Kd == kd_value);

            kp_subset = Kp(idx);
            [kp_sorted, order] = sort(kp_subset);

            % Extract the selected metric from each struct.
            metric_subset = [results(idx).(metric_names{p})];
            metric_sorted = metric_subset(order);

            if strcmp(metric_names{p}, 'overshoot_rel')
                metric_sorted = 100 * metric_sorted;
            end

            plot(kp_sorted, metric_sorted, '-o', ...
                'LineWidth', 1.5, ...
                'DisplayName', sprintf( ...
                    'Ki=%g, Kd=%g', ki_value, kd_value));
        end

        xlabel('Proportional gain Kp');
        ylabel(y_labels{p});
        title(titles{p});
        legend('Location', 'best');

        hold off;
    end
end
