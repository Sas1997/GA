%%Seyyed Ali Sadat
%%Sasadat@ieee.org
function [ population ] = initialization(M, N,lb,ub)

for i = 1 : M
    for j = 1 : N 
        population.Chromosomes(i).Gene(j) = unifrnd(lb,ub,1);
    end
end

