# Reflection

## Where did your manual code differ from the AI version structurally? (libraries chosen, function decomposition, CLI parsing, plot defaults)

The first time I generated the AI files, the agent read the files already present in my manual folder and essentially duplicated them. I had to start up a new agent with no file reading history and explicitly tell it not to reference any of the files pre-existing in the directory, and then make it generate the regression notebooks and scripts.

Structurally, the AI code in the jupyter notebooks included more validation of the file inputs than I did (confirming data within .csv was float/numerical, confirming complete (x,y) pairs for each value). It used the same libraries as I did, but the individual functions were more complex and output more detailed model evaluation parameters. 

The execuable scripts took the same arguments as the ones I manually generated. Similar to the jupyter notebooks it generated, the agent included more datatype validation steps at the beginning of the scripts (confirming input file existence, column name presence) which help make the script more univerally applicable. 

The plots generated are pretty similar to the ones I made- some of the aesthetics are different but the agent used the same graphing packages to generate the plots as I did. 

## Which one is more readable to you? Which one would another scientist understand faster?

## Did the AI introduce bugs you wouldn't have written? Did it skip steps you would have included?

## Did the AI version's CLI behave the way you'd expect, or did it require unusual invocation?
