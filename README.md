# warOfAttrition
Used R to simulate a population competing with itself in the war of attrition. 

The pdf is my research paper on the war of attrition that I completed with two partners during the COSMOS summer program. 

I did a majority of the code with some assistance from Dr. Sebastian Schreiber. 

Short description of the code: It creates a payoff matrix called A that determines the result of a certain strategy “x” versus “y.” If x wins, it gains the victory points “V” and loses points based on how many rounds y stayed in. A population is created with a uniform density curve. By using matrix multiplication of the population against the payoff matrix, it can find the population at the next timestep. A plot of the population is shown over the timesteps and compared to the Nash Equilibrium. 

Short description of the project:

Our project did a simulation of species competing using the war of attrition. The war of attrition can easily be visualized when describing two animals fighting for food. They both invest significant resources into a prize, but in the end, only the one that wins the fight will get the food. For our model, we assumed that the animals would all use a pure strategy, meaning that they would be willing to fight for a certain number of rounds until giving up. The winner of the prize was determined by which animal was willing to fight while the other stopped fighting. For example, a strategy of 2 versus a strategy of 10 would result in the 10 gaining the prize and both sides expending 2 units of energy. 

The Nash Equilibrium is a probability function that expresses the optimal strategy. Our calculated Nash Equilibrium for the war of attrition was the probability function: p(x) =  e^(x/v)/v, meaning that for a reward of value V, it would play a strategy of staying in for x turns with a chance of p(x). The Nash Equilibrium has a property that if a population of pure strategies competes against each other, the population density graph will eventually take the form of the Nash Equilibrium. Our code ran a simulation of the population to see if it would align with the Nash Equilibrium.
