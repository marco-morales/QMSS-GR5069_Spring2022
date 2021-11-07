## WEEK 6 - Missing Data & Data Quality

__Missing Data__ is a topic that is seldom addressed explicitly in Data Science. There are a lot of assumptions that need to be made about your data so you can safely ignore missingness. And it is terribly dangerous not to unpack those assumptions clearly.  

For the same reasons, our resources for missing data will be more academic than in previous weeks, and they might take a bit longer to go through but will be worth your while in your day-to-day as a Data Scientist.


### Identification Problems

This is a topic that many social scientists have tackled from many different angles, but perhaps the most comprehensive view of it exists in Charles Manski's (1993) article - [__Identification Problems in the Social Sciences__](https://www.jstor.org/stable/pdf/271005.pdf?seq=1). He starts by making a sharp distinction of __identification__ from another problem that social scientists are also concerned with: __inference__.

> Studies of identification determine the conclusions that could be drawn if a researcher were able to observe a data sample of unlimited size. Statistical inference seeks to characterize how sampling variability affects the conclusions that can be drawn from samples of limited size.

As a Data Scientist with a social science background, spend your time focusing on the sections on __extrapolation__ and __selection__ as you read through the article. This will give you a powerful applied perspective on why you should always be asking yourself __where does my data come from?__, and __what can (and cannot) be done with it?__ Critical thinking about data at its best!

There is a lot more to be said about this topic - both in terms of theoretical elaborations and many proposed solutions. Manski has two book-length treatments that every Data Scientist should read - [__Identification Problems in the Social Sciences__](https://www.hup.harvard.edu/catalog.php?isbn=9780674442849) (1995) and  [__Identification for Prediction and Decision__](https://www.hup.harvard.edu/catalog.php?isbn=9780674026537) (2007).

### Missing Data

Thinking about data missingness requires a powerful yet flexible framework. Don Rubin created just that, starting in the 1970s with his (1976) article - [__Inference and Missing Data__](https://academic.oup.com/biomet/article-abstract/63/3/581/270932?redirectedFrom=fulltext) where he lays out the foundations for understanding data missingness mechanisms and their empirical implications for inference (which can easily be extended for prediction). These notions are extended and illustrated empirically in the context of survey data in his (1977) article - [__Formalizing Subjective Notions About the Effect of Nonrespondents in Sample Surveys__](https://www.jstor.org/stable/2286214?seq=1). You will also want to read Little's (1992) article - [__Regression With Missing X's: A Review__](https://www.jstor.org/stable/2290664?seq=1) - on the effects of modeling when your data has missingness.

Dealing with missing data is a very complicated affair. But there are two superb book-length resources with outstanding empirical applications and very rigorous statistical thinking to help you if you deal with complicated missingness patterns. They are Little and Rubin's (2002) book - [__Statistical Analysis with Missing Data__](https://onlinelibrary.wiley.com/doi/book/10.1002/9781119013563) and Rubin's (2004) book - [__Multiple Imputation for Nonresponse in Surveys__](https://www.wiley.com/en-us/Multiple+Imputation+for+Nonresponse+in+Surveys-p-9780471655749).

### What can be done with Big Data

There are a lot of misconceptions about what can be done when your data explodes in _n_. A few years ago (2015), a group of very smart scholars delved into dissecting the opportunities and shortcomings of the Big Data revolution. While their focus was academic research, many of their insights are incredibly relevant for Data Science event today.

While you may want to skim through the whole [issue](https://www.cambridge.org/core/journals/ps-political-science-and-politics/issue/F71EE285BFB51E27DCE368E94D5A0F8B), we'd suggest a couple of pieces to focus on. Nagler and Tucker's (2015) article - [__Drawing Inferences and Testing Theories with Big Data__](https://www.cambridge.org/core/journals/ps-political-science-and-politics/article/drawing-inferences-and-testing-theories-with-big-data/FBA853C140713FC45DB2ABCF91808B18) - where they address some of the identification issues we'll discuss this week. Also, Roc&iacute;o Titiunik's (2015) article - [__Can Big Data Solve the Fundamental Problem of Casual Inference?__](https://www.cambridge.org/core/journals/ps-political-science-and-politics/article/can-big-data-solve-the-fundamental-problem-of-causal-inference/A6737446D01B322A5EC9B8F138242B74) - where she explores an interesting difference between big data as growing in _n_ as different from big data that grows in _p_. 
