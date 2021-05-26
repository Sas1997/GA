%%Seyyed Ali Sadat
%%Sasadat@ieee.org
function [BestChrom]  = GeneticAlgorithm (npop , dim, MaxGen ,ub,lb, Pc, Pm , Er , obj, visuailzation)



cgcurve = zeros(1 , MaxGen);

%%  Initialization
[ population ] = initialization(npop, dim,lb,ub);
for i = 1 : npop
    population.Chromosomes(i).fitness = obj( population.Chromosomes(i).Gene(:));
end

g = 1;
disp(['Generation #' , num2str(g)]);
[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
cgcurve(g) = population.Chromosomes(indx(1)).fitness;



%% Main loop
for g = 1 : MaxGen

    for k = 1: 2: npop
        % Selection
        [ parent1, parent2] = selection(population);
        
        % Crossover
        [child1 , child2] = crossover(parent1 , parent2, Pc, 'double');
        
        % Mutation
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);
        
        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end
    
    % Calcualte the fitness values
    for i = 1 : npop
        newPopulation.Chromosomes(i).fitness = obj( newPopulation.Chromosomes(i).Gene(:));
    end
    
    % Elitism
    [ newPopulation ] = elitism(population, newPopulation, Er);
    
    cgcurve(g) = newPopulation.Chromosomes(1).fitness;
    
    population = newPopulation; % Replace the previous population with the newly made
    
    BestChrom.Gene    = population.Chromosomes(1).Gene;
    BestChrom.Fitness = population.Chromosomes(1).fitness;
    disp([' it= ' num2str(g) ' best fit= ' num2str(BestChrom.Fitness) ])
    


 
    
end

   



if visuailzation == 1
    figure
    plot( 1 : MaxGen , cgcurve,'k-s');
    xlabel('Generation');
    ylabel('Fitness of the best elite')
end


end