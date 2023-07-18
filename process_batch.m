%% Init
clc; clear all

% Conflicting functions pass2, pass3 from Robust Control Toolbox
% which are NOT overridden by load, which I don't understand
rmpath('/PRODCOM/MATLAB/matlabr2023a/toolbox/robust/rctobsolete/mutools/subs')

fol = '/work/bneel/alligator-processing/';
imdir = fullfile(fol, 'piv-images');
savedir = fullfile(fol, 'piv-sessions');

settings = table2struct(readtable(fullfile(savedir, 'PIVlab_settings_additional-20230718.csv')));
n_cores = 10;

%% Loop through cases
for i=1: length(settings)
    k = sprintf('%04d', settings(i).data_id);
    
    imgs = fullfile(imdir, [k '-uint8']);
    masks = fullfile(imdir, [k '-masks'], '*.tif');
    fname = fullfile(savedir, [k '.mat']);

    PIVlab_GUI_case(n_cores, imgs, masks, fname, settings(i))
end
