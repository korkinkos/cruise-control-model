
project_root = fileparts(mfilename("fullpath"));

addpath(fullfile(project_root, "parameters"));
addpath(fullfile(project_root, "visualization"));

model_path = fullfile(project_root, "cruise_control.slx");
figures_dir = fullfile(project_root, "results", "figures");

% Create output directory if it does not exist
if ~isfolder(figures_dir)
    mkdir(figures_dir);
end

addpath(fullfile(project_root, "results"));

fprintf("Project initialized at:\n%s\n", project_root);
