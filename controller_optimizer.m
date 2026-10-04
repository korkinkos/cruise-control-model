Kp_range = [25 50 75 100 125 150];
Ki_range = [0.0, 10.0];
Kd_range = [0.0];

% results = struct([]);

for i = 1:length(Kp_range)
    for j = 1:length(Ki_range)
        for k = 1:length(Kd_range)
            Kp = Kp_range(i);
            Ki = Ki_range(j);
            Kd = Kd_range(k);

            result = analyze_results(Kp, Ki, Kd);
        
            result.Kp = Kp;
            result.Ki = Ki;
            result.Kd = Kd;
            
            if i == 1 && j == 1 && k == 1
                results = result;
            else
                results(i, j, k) = result;
            end
        end
    end
end