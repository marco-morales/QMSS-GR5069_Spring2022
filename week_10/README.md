## WEEK 10 - Explanation vs Prediction

The __difference between explanation and prediction__ is an often overlooked topic in Data Science based on a widespread belief that _all  work in Data Science is strictly predictive_. This has become such a commonly held misconception that many use prediction as the sole characteristic to define the field.

It should be clear by now that the main skill of a Data Scientist is thinking critically about data, not treating every problem as a prediction problem. The reality is that no predictive work can consistently be good predictive work absent critical thinking about data. And understanding the difference between explanation and prediction is central to answering questions effectively and using data efficiently.

### How to think about this difference?

This is another area where the academic literature provides very useful guidance on ways to think about the difference between explanation and prediction.

One camp, best exemplified by Galit Shmueli's (2010) article - [__To Explain or To Predict?__](http://projecteuclid.org/download/pdfview_1/euclid.ss/1294167961) - poses that __explaining and predicting are two very different undertakings__ that follow different logics, employ different methods and produce different outputs. In her view, __the difference between explanatory and predictive models lies in measurement error__ :  

> Why should there be a difference between explaining and predicting? The answer lies in the fact that measurable data are not accurate representations of their underlying constructs. The operationalization of theories and constructs into statistical models and measurable data creates a disparity between the ability to explain phenomena at the conceptual level and the ability to generate predictions at the measurable level.

Perhaps her most acute point is that failing to recognize this difference creates, in practice, a confusion with far reaching consequences :

> A common misconception in various scientific fields is that predictive power can be inferred from explanatory power.  

The other camp, best exemplified by Leo Breiman's (2001) classical article - [__Statistical Modeling: The Two Cultures__](https://projecteuclid.org/download/pdf_1/euclid.ss/1009213726) - argues that __any difference between explanation and prediction results from a misguided reliance on data models__. This practice has led to a poor representation of reality

> Higher predictive accuracy is associated with more reliable information about the underlying data mechanism. Weak predictive accuracy can lead to questionable conclusions.

While valid under strict assumptions, Breiman's argument fails to recognize Shalit's point about measurement error and also the fact that explanatory (data) models are - and must be - simplifications of observed reality by construction. This last point is an epistemological one that dates back to Milton Friedman's (1966) insightful article - [__The Methodology of Positive Economics__](http://kimoon.co.kr/gmi/reading/friedman-1966.pdf) :

> A hypothesis is important is it "explains" much by little, that is if it abstracts the common and crucial elements from the mass of complex and detailed circumstances surrounding the phenomena to be explained and permits valid predictions on the basis of them alone. To be important, therefore, a hypothesis must be descriptively false in its assumptions.  

Explanation and prediction, therefore, cannot be the same exercises except under very specific circumstances.

### How to work with this difference?

Now that we have established the difference between explanation and prediction more clearly, it is also important to keep in mind some of the sharper wisdom that we have accumulated about predictive exercises and their departure/overlap with explanatory exercises. A trio of pieces by J Scott Armstrong - in the context of time-series forecasting - summarize much of the state of the art on prediction that is applicable across the board:

*  a (2001) chapter - [__Evaluating Forecasting Methods__](https://repository.upenn.edu/marketing_papers/146/?utm_source=repository.upenn.edu%2Fmarketing_papers%2F146&utm_medium=PDF&utm_campaign=PDFCoverPages) - that summarizes steps and principles to evaluate forecasts based on dense stack of academic research.
* a (2011) paper - [__Illusions in Regression Analysis__](https://repository.upenn.edu/cgi/viewcontent.cgi?article=1190&context=marketing_papers) - that illustrates the empirical differences between fitting models and generating predictions/forecasts
* a (2015) article with colleagues - [__Golden rule of forecasting: Be conservative__](https://www.sciencedirect.com/science/article/pii/S0148296315001459) - that compiles principles that summarize current knowledge on predicting/forecasting

## ADDENDUM - Conditional relationships in the data

A topic related to the discussion (and distinction between) explanation vs prediction relates to the modeling and interpretation of __Conditional Relationships in the data__. Conditional relationships are ubiquitous in behavioral data, and Data Science is plagued with data that compiles human behaviors. Extracting additional insights from behavioral data by modeling the effects of a feature on a target variable when another feature takes on a specific value is not always taught on a typical Data Science curricula.

### Parametric Approaches

A simple yet powerful approach to unpacking conditional relationships in your data relies on employing linear regression, where you specify the functional form of your interactions and parametrize them. Your estimated model will have a number of embedded assumptions, but will be straightforward to interpret once you understand the mechanics to do it.

A great starting point is Brambor, Clark and Golder's (2006) article - [__Understanding Interaction Models: Improving Empirical Analyses__](https://www-jstor-org.ezproxy.cul.columbia.edu/stable/25791835?pq-origsite=summon&seq=1#metadata_info_tab_contents) - who have taken the time to distill a potentially complicated topic into consumable pieces and best practices for modeling conditional relationships in the data and interpreting them. You might also want to explore Matt Golder's site -  [__Interactions__](http://mattgolder.com/interactions) - for many more resources, and continually updated materials.

More complicated conditional relationships require a deeper treatment under this parametric approach. If you are in those deeper waters, take advantage of Kam and Franzese's (2007) book - [__Modeling and Interpreting Interactive Hypotheses in Regression Analysis__](https://www.press.umich.edu/206871/modeling_and_interpreting_interactive_hypotheses_in_regression_analysis) - which is an in-depth resource to understand interactions under many settings and quantify conditional effects in all of them. For an even more advanced treatment of linear regression and interactions, as well as the matrix algebra and asymptotics behind them, you can always consult any edition of Bill Greene's foundational book - [__Econometric Analysis__](https://www.pearson.com/us/higher-education/program/Greene-Econometric-Analysis-8th-Edition/PGM334862.html)

### Non-parametric Approaches

Non-parametric approaches are more flexible to handle conditional relationships in the data. Cognizant of that, the causal inference literature has been incorporating machine-learning methods to account for heterogenous treatment effects. In particular, __Bayesian Additive Regression Trees (BART)__ have been identified as a particularly well-suited algorithm in this context. Read
* Jennifer Hill's (2011) article - [__Bayesian Nonparametric Modeling for Causal Inference__](https://www.tandfonline.com/doi/abs/10.1198/jcgs.2010.08162) - for a great overview on applying BART to model conditional relationships, and
* Chipman, George and McCulloch's (2010) article - [__BART: Bayesian Additive Regression Trees__](https://projecteuclid.org/euclid.aoas/1273584455) - for a clear introduction to this tree-based method.  

#### Interpreting Conditional Relationships

Because of the black-box nature of machine-learning algorithms, it is not straightforward to extract insights from the interactions and non-linearities that they natively capture. (Nearly) independent developments in the Statistics, Machine-Learning and Computer Science fields over the last two decades provide intuitive ways to interpret conditional relationships from non-parametric methods.

The Applied Statistics field developed the concept of __"first differences"__ to extract marginal effects from interactions. Read King, Tomz and Wittenberg's (2000) article - [__Making the Most of Statistical Analyses: Improving Interpretation and Presentation__](https://www.jstor.org/stable/2669316?seq=1) - where they very cleanly describe the rationale for computing "first differences" and means to incorporate the uncertainty that accompanies these estimates.

For more comprehensive treatments on first differences, read King's (1998) book - [__Unifying Political Methodology__](https://www.press.umich.edu/2153576/unifying_political_methodology) - or Gelman and Hill's (2007) book - [__Data Analysis Using Regression and Multilevel/Hierarchical Models__](https://www.cambridge.org/core/books/data-analysis-using-regression-and-multilevelhierarchical-models/32A29531C7FD730C3A68951A17C9D983) - for an even more detailed treatment of the topic from a Bayesian perspective.

Almost concurrently, the Machine-Learning field evolved the concept of __"partial dependence functions"__ as described in Friedman's (2001) lecture - [__Greedy Function Approximation: A Gradient Boosting Machine__](https://www.jstor.org/stable/2699986?seq=1) - which are a direct progression of the methods described in Becker, Cleveland and Shyu's (1996) article - [__The Visual Design and Control of Trellis Display__](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.154.7324&rep=rep1&type=pdf) - to visualize conditional marginals.

More recently, related methods have surfaced in the Computer Science field under the __Shapely Additive Explanations (SHAP)__ umbrella, described on Lundberg and Lee's (2017) article - [__A Unified Approach to Interpret Model Predictions__](http://papers.nips.cc/paper/7062-a-unified-approach-to-interpreting-model-predictions.pdf). To our immediate interest, an even more recent development has been the introduction of __SHAP interaction values__ described in Lundberg, Erion and Lee's (2019) article - [__Consistent Individualized Feature Attribution for Tree Ensembles__](https://arxiv.org/pdf/1802.03888.pdf)

#### Other algorithms asides from BART

Note that BART is not the only algorithm that has been advanced to deal with conditional relationships. Others have been proposed, like Random Forests in this article by Wager and Athey (2018) - [__Estimation and Inference of Heterogeneous Treatment Effects using Random Forests__](https://www.tandfonline.com/doi/full/10.1080/01621459.2017.1319839) - or LASSO in this article by Signorino and Kirchner (2018) - [__Using LASSO to Model Interactions and Nonlinearities in Survey Data__](https://www.surveypractice.org/article/2716-using-lasso-to-model-interactions-and-nonlinearities-in-survey-data).
