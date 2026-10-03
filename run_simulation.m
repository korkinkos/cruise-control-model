init;

out = sim("cruise_control.slx");

v = out.v.Data;
t = out.v.Time;

error = v_ref - v;
rmse = sqrt(mean(error.^2));
overshoot = max(0, max(v) - v_ref);
overshoot_rel = overshoot / v_ref * 100.0;

subplot(2, 1, 1);
plot(t, error);
xlabel("Time (s)");
ylabel("Velocity Error (m/s)");
title("Cruise Control Tracking Error");
grid on;

subplot(2, 1, 2);
plot(t, v);
xlabel("Time (s)");
ylabel("Velocity (m/s)");
title("Velocity");
grid on;

t95 = t(find(v >= v_ref * 0.95, 1));
unsafe_band = find(v < 0.98*v_ref | v > 1.02*v_ref);
safe_stretch = t(unsafe_band+1: end);
