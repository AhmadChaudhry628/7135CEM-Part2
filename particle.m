clc, clear, close all
rng default
global initial_flag
%% Particle Swarm Optimization 15 iterations
initial_flag = 0;
options = optimoptions('particleswarm','PlotFcn',{@pswplotbestf});
for i=1:15
    initial_flag = 0;
    % pso for CEC function 2, D=2
    [pso_x,pso_val,pso_exit_flag,pso_op] = particleswarm(@(x)benchmark_func(x,6),10,[],[],options);
    pso_main_val(i) = pso_val;
    pso_main_exit_flag(i) = pso_exit_flag;
    pso_main_op(i) = pso_op;
    % save visualizations to file
    fname = sprintf('filename_pso(%d).fig', i) ;
    savefig(fname)
end
%% PSO 15 iteration measures
pso_val_max = max(pso_main_val)
pso_val_min = min(pso_main_val)
pso_val_mean = mean(pso_main_val)
pso_val_std = std(pso_main_val)
