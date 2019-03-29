# Continuous-Evolutionary-System---Genetic-Algorithm-

                                           An Evolution simulator of sea life.
                                    -- inspired from Daniel Shiffman(TheCodingTrain)    

The ecosystem is initialized with the random population of fish. Each fish has a DNA which determines it’s speed, sizeof fin, sizeof tail fin, teeth size, eye size, gender, body_size, mate_choice_1, mate_choice_2. So, the DNA is kinda “phenotype”. This DNA sequence determines the behavioral aspects and aesthetics of the fish.  Every fish is fertile and can only participate in mating after it reaches a specified age ( > 5 minutes from birth_time). A new fish is born when a female fish and male fish with the same mating choices approach each other and they have about 50%  chance of reproductive success. Each fish also has a “health” parameter (initialized to 100) which is reduced by 10 every time a fish participates in mating. That means, eventually these fishes will die, but their characteristics are preserved in their offsprings through DNA cross-over and DNA mutation. This process continues.
In the simulated environment, we can provide food for the fish(by clicking anywhere on the window) or the dead fishes’ leftover is converted to food for the remaining fishes. Every time a fish ingests food, its health is increased by 5.
And like in traditional Genetic Algorithm, it doesn’t have any fitness function.so, it the survival of the survivors model rather than the survival of fittest.

Tweak the parameters and do all sorts of crazy stuff like restricting the gender to be of one kind and let the fishes find a way to reproduce, add a hunting feature, traits to attract opposite sex, etc.

Actually, the fishes are static images(chosen based on their DNA) and I end up using them rather than dynamically structure fishes based on their DNA.

(All images are copyright to their respective owners)
