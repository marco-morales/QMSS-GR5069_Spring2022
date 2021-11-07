## WEEK 12 - WORKSHOP: Data Visualizations

Graphs as we know them today had their inception in the [XVII Century](https://www.tandfonline.com/doi/abs/10.1198/tast.2010.09154), with some scant applications in the two centuries that followed - including [Florence Nightingale's famous reports](https://www.theguardian.com/news/datablog/2010/aug/13/florence-nightingale-graphics) that changed sanitary policy in the British Army. Yet, it was not until the XX Century that visualizations started to be a mainstay in the scientific toolbox. That begs the question: __if for most of human history we summarized data in tables, why would we ever want to spend time with visualizations?__

Andrew Gelman's (2011) article - [__Why Tables Are Really Much Better Than Graphs__](https://www.jstor.org/stable/23113375?seq=1#page_scan_tab_contents) -  does a remarkable job discussing the virtues of graphs relative to tables. Put your facetious-state-of-mind on when you read it, and remember that it was written as

> a series of attacks on graphical methods in the voice of a hypothetical old-school analytical statistician or social scientist.

### Creating effective visualizations

There are situations - and quite a lot of them - when we'd want to summarize information with visualizations. But the real challenge is not just using any visualization, but an effective one.

Perhaps the real starting point of effective visualizations was Cleveland and McGill's (1984) article - [__Graphical Perception: Theory, Experimentation, and Application to the Development of Graphical Methods__](https://www.jstor.org/stable/2288400) - that became a classic for being the first experiment-based comprehensive treatment of __graphical perceptions__ as the foundation to building effective graphs.

More recently, people have been evangelizing effective visualizations, and illustrating their points with clear principles and examples. Gelman, Passarica and Dodhia's (2002) article - [__Let’s Practice What We Preach: Turning Tables into Graphs__](http://www.stat.columbia.edu/~gelman/research/published/dodhia.pdf) - provides more comprehensive view of the benefits of transforming tables into graphs, including some very useful illustrations of their points. Kastellac and Leoni's (2007) article - [__Using Graphs Instead of Tables in Political Science__](https://www.jstor.org/stable/20446574?seq=1) - makes a similar case bringing in additional examples. Niemi and Gelman's (2011) article - [__Statistical Graphs: Making Information Clear and Beautiful__](http://www.stat.columbia.edu/~gelman/research/published/Niemi_GraphicsInformation.pdf) - is almost a cheatsheet that illustrates some very simple principles for creating effective visualizations.


If this topic is of interest to you, make sure to check out these book-length treatments:

* Tufte's [__The Visual Display of Quantitative Information__](https://www.amazon.com/Visual-Display-Quantitative-Information/dp/0961392142/ref=sr_1_1?s=books&ie=UTF8&qid=1486764971&sr=1-1&keywords=The+Visual+Display+of+Quantitative+Information), [__Visual Explanations__](https://www.amazon.com/Visual-Explanations-Quantities-Evidence-Narrative/dp/0961392126/ref=sr_1_1?s=books&ie=UTF8&qid=1486765024&sr=1-1&keywords=visual+explanations), [__Envisioning Information__](https://www.amazon.com/Envisioning-Information-Edward-R-Tufte/dp/0961392118/ref=sr_1_1?s=books&ie=UTF8&qid=1486765056&sr=1-1&keywords=envisioning+information) or [__Beautiful Evidence__](https://www.amazon.com/Beautiful-Evidence-Edward-R-Tufte/dp/0961392177/ref=sr_1_1?s=books&ie=UTF8&qid=1486765101&sr=1-1&keywords=beautiful+evidence)
* Cleveland's [__Element's of Graphing Data__](https://www.amazon.com/dp/0963488414/) or [__Visualizing Data__](https://www.amazon.com/Visualizing-Data-William-S-Cleveland/dp/0963488406)
* Robbins' [__Creating More Effective Graphs__](https://www.amazon.com/Creating-Effective-Graphs-Naomi-Robbins/dp/0985911123)
* Cairo's [__The Functional Art__](https://www.amazon.com/Functional-Art-introduction-information-visualization/dp/0321834739/ref=sr_1_3?s=books&ie=UTF8&qid=1486761450&sr=1-3&keywords=alberto+cairo) or [__The Truthful Art__](https://www.amazon.com/Truthful-Art-Data-Charts-Communication/dp/0321934075/ref=sr_1_1?s=books&ie=UTF8&qid=1486761450&sr=1-1&keywords=alberto+cairo)
* Healy's [__Data Visualization: a Practical Introduction__](http://socviz.co)
* Wilke's [__Fundamentals of Data Visualization__](https://serialmentor.com/dataviz/)

### Color: physics and theory

Color is perhaps one of the hardest parts of creating good graphs. Get started with an hour-long enjoyable introduction to color with this [Radiolab](https://www.wnycstudios.org/shows/radiolab) episode - [__Colors__](https://www.wnycstudios.org/story/211119-colors).

Using colors - and color combinations - appropriately is one of the most important aspects of good visualizations. A good resource is the chapter on [Color scales](https://serialmentor.com/dataviz/color-basics.html) on Wilke's [book](https://serialmentor.com/dataviz/). If you need further advice, and some additional help, read Brewer, Hatchard and Harrower's (2013) article - [__ColorBrewer in Print: A Catalog of Color Schemes for Maps__](https://www.tandfonline.com/doi/abs/10.1559/152304003100010929?src=recsys) - originally directed to color in cartography, but with  good color advice that goes beyond maps. They also created a very useful website - [__ColorBrewer__](http://colorbrewer2.org/) - to try out some of this advice.  

### DOs and DON'Ts

People have summarized wisdom on what (not) to do with graphs. A few interesting resources you may want to check out:

* Hyndman's (2010) blog post - [__Twenty rules for good graphics__](http://robjhyndman.com/hyndsight/graphics/) - suggests some principles for good visualizations
* Bergstrom and West put together the [Calling Bullshit](https://callingbullshit.org/index.html) course. Their Data Visualization session contains very good advice and examples to avoid [__misleading graph axes__](http://callingbullshit.org/tools/tools_misleading_axes.html) and applying the [__principle of proportional ink__](https://callingbullshit.org/tools/tools_proportional_ink.html)
* Karl Broman maintains a shame list - [__The top ten worst graphs__](https://www.biostat.wisc.edu/~kbroman/topten_worstgraphs/) - for the scientific literature
* Weiner's (1984) article - [__How to Display Data Badly__](http://www.jstor.org/stable/2683253) - compiles "12 principles" for bad data visualization


### Graph (and code) repos

Because of the importance of data visualizations, people maintain a number of resources where you can get advice, inspiration and code:

* STHDA's section on [Data Visualization](http://www.sthda.com/english/wiki/data-visualization)
* the subreddit for data visualizations: [r/dataisbeautiful](https://www.reddit.com/r/dataisbeautiful/)
* [The R Graph Gallery](https://www.r-graph-gallery.com)
* [Top 50 ggplot2 visualizations](http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html#Scatterplot)
* [R Graph Catalog](http://shinyapps.stat.ubc.ca/r-graph-catalog/)

### Additional R resources

There is one aspect where R is unparalelled: producing beautiful visualizations. One of the main reasons is the [`ggplot2`](https://cran.r-project.org/web/packages/ggplot2/index.html) package. Its [tidyverse page](https://ggplot2.tidyverse.org) is extensively documented, and you'll be able to find most answers on what you can do and how you can do it with the package. Of course, among RStudio's [cheatsheets](https://www.rstudio.com/resources/cheatsheets/) you'll be able to find one for `ggplot2`.

For a more extensive treatment, you can go directly to the source with Wickham's book - [__ggplot2: Elegant Graphics for Data Analysis__](https://www.amazon.com/dp/0387981403/ref=cm_sw_su_dp?tag=ggplot2-20) that includes code examples. Also, keep your [__R Graphics Cookbook__](http://shop.oreilly.com/product/0636920023135.do) handy.


(__Hat tip__ to [__Sebasti&aacute;n Garrido__](http://segasi.com.mx) who kindly suggested many of the resources shared here.)
