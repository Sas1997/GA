
clear
clc
close all
%%Seyyed Ali Sadat
%%Sasadat@ieee.org

%% controling paramters of the GA algortihm
fitness = @woods;
ub=10;
lb=-10;
npop = 50; % 
dim = 4;  % number of genes (variables)
max_it = 1000;
Pc = 0.5;
Pm = 0.1;
Er = 0.2;
visualization = 1; % set to 0 if you do not want the convergence curve 
%% plot function 
PlotFun(lb,ub);

%% Run GA
[BestChrom]  = GeneticAlgorithm (npop , dim, max_it ,ub,lb,Pc, Pm , Er , fitness , visualization );

disp('The best chromosome found: ')
BestChrom.Gene
disp('The best fitness value: ')
BestChrom.Fitness