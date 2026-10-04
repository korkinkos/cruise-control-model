function [t, v, error] = run_simulation(Kp, Ki, Kd)
    run("parameters/vehicle_parameters.m")
    % run("parameters/controller_parameters.m")
    run("parameters/input_parameters.m")
    
    out = sim("cruise_control.slx", "SrcWorkspace", "current");
    
    v = out.v.Data;
    t = out.v.Time;
    error = v_ref - v;
end