# Assignment 2 reflection

## Where did your manual code differ from the AI version structurally? (libraries chosen, function decomposition, CLI parsing, plot defaults)

The first time I generated the AI files, the agent read the files already present in my manual folder and essentially duplicated them. I had to start up a new agent with no file reading history and explicitly tell it not to reference any of the files pre-existing in the directory, and then make it generate the regression notebooks and scripts.

Structurally, the AI code in the jupyter notebooks included more validation of the file inputs than I did (confirming data within .csv was float/numerical, confirming complete (x,y) pairs for each value). It used the same libraries as I did, but the individual functions were more complex and output more detailed model evaluation parameters. 

The execuable scripts took the same arguments as the ones I manually generated. Similar to the jupyter notebooks it generated, the agent included more datatype validation steps at the beginning of the scripts (confirming input file existence, column name presence) which help make the script more univerally applicable. 

The plots generated are pretty similar to the ones I made- some of the aesthetics are different but the agent used the same graphing packages to generate the plots as I did. 

## Which one is more readable to you? Which one would another scientist understand faster?

The AI didn't include script comments to explain stepwise what it is doing- seems like I would have had to ask for this explicitly. These scripts run simple commands that I am lucky to be familiar with, but it is good to know in the future that I would have to ask for included annotations. Given this caveat, my own script is more readable to me because of the comments explaining the steps it runs. I think another scientist would be able to understand my code faster because of the annotations.


## Did the AI introduce bugs you wouldn't have written? Did it skip steps you would have included?

The AI accounted for possible bugs that I didn't and included checks at the beginning of the script to avoid errors later on. It didn't skip any steps I would have included. It did include a script to export the jupyter notebooks as opposed to doing it within the JupyterLab GUI, but ran into trouble getting that script to run correctly because it was having to activate a new conda env to export them because my base conda env is a little bit broken :) (working on fixing it)

## Did the AI version's CLI behave the way you'd expect, or did it require unusual invocation?

The AI's version of the CLI behaved pretty much as expected- the arguments needed were similar to the ones I generated manually. I did tell the AI to take 3 arguments (filename, x-column and y-column) which is likely why it behaved as I expected.