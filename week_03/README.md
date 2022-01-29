## WEEK 3 - WORKSHOP: Setting up Projects: Data Science & Data Engineering Perspectives

#### In preparation for this week:
* read/listen/watch as much as you can from the annotated materials below
* watch pre-recorded lectures on Canvas

---

Data Science work in general must fulfill three aims to be useful for collaboration:

* **replicability**
* **portability**
* **scalability**

This week we'll discuss some principles - and tricks - that take your projects to that level. To prepare the discussion, you may want to skim through some of the links below to get a sense of how people have implemented DS projects and the structures they have though behind their proposed structures.

#### Creating DS project structures

People have put thought into standardizing project creation practices in Data Science, to the point of automating the creation of projects in ways that are generic and flexible enough to encompass multiple use cases. Two very useful ones are [Cookiecutter for Data Science](http://drivendata.github.io/cookiecutter-data-science/) tailored for Python, and [ProjectTemplate](http://projecttemplate.net/index.html) developed for R.

While you may or may not want to use them to create your projects, they are certainly a rich source of food for thought on what needs to be considered when creating a Data Science project.

As [Cookiecutter](http://drivendata.github.io/cookiecutter-data-science/#be-conservative-in-changing-the-default-folder-structure) would put it: "be _liberal_ in changing the folders around for your project, but be _conservative_ in changing the default structure for all projects."

### Cloud computing for our live workshops

We will be using "the Cloud" for the majority of our collaborative work in ths course, including our live in-class workshops. It is important to understand the basic and meaning of what Cloud Computing means. This [Medium Article](https://towardsdatascience.com/aws-and-cloud-computing-for-dummies-84525fbabd1e) talks about the traditional IT Infrastructure, types of cloud services and benefits of the cloud.

#### An Introduction to Apache Spark

What is [**Apache Spark**](https://spark.apache.org)? - Many organizations have adapted to using Apache Spark for large scale data processing and machine learning models. Apache Spark has been proven to provide speed, efficiency and reliability in many use cases. In this course we will be using [**Databricks**](https://databricks.com) which is a managed Apache Spark Platform that allows the management of Apache Spark easy. In addition, Databricks provides a very collaborative platform for both Data Scientists and Data Engineers to build data pipelines and productionalize machine learning models very easily. Skim as much as you can from the materials below (it will pay off later in the class):

* [**Intro to Apache Spark**](https://www.youtube.com/watch?v=9U4ED7KQwlE&t=22s): a 60-min video to provide an easy to digest introduction to Spark for all audiences
* [**"An Architecture for Fast and General Data Processing on Large Clusters"**](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2014/EECS-2014-12.pdf): Mattei Zaharia's doctoral dissertation to get a great theoretical introduction to Spark
* [**Learning Spark, 2nd edition**](https://pages.databricks.com/rs/094-YMS-629/images/LearningSpark2.0.pdf): a book-length introduction to Spark - from zero to Spark in 12 chapters!
* free [**self-paced learning courses**](https://docs.google.com/document/d/14YSH67RYaIcgHbgxs-MaDOjpWWGEfskkmDFIOREiRDs/edit) from [Databricks](https://databricks.com) for university students
* [Databricks notebook gallery](https://databricks.com/discover/notebook-gallery) featuring sample notebooks for a large range of use cases
* [Apache Spark GitHub Repo](https://github.com/apache/spark)
* [Research Papers](https://spark.apache.org/research.html)


### Current Best Practices in Data Science

We will cover many current best practices in the field throughout the course. But there is one which still stirs passions: __Agile__. Some swear by it, while others swear it's not s good idea for Data Science work.  (Not surprisingly, one of us is a big believer in the Agile way, but the other is a big believer in only implementing Agile-like principles when it makes sense). The jury is still out on __Agile__, but precisely for that reason you should understand what it is and what makes it attractive in the field. A few recommended posts will help you get there.

Start by reading [__The Psychology of Agile__](https://medium.com/agile-in-learning/the-psychology-of-agile-87f92521a5ed) that summarizes the benefits that people perceive from the **Agile** way. Read also [__Stop Brainstorming and Start Sprinting__](https://medium.com/@jakek/stop-brainstorming-and-start-sprinting-16180839b43d) about what a **sprint** is, how it works, and why it's useful, but don't forget to read a complementary perspective in [__From Agile to Fragile: How to unravel your team in one sprint__](https://medium.com/agile-in-learning/from-agile-to-fragile-how-to-unravel-your-team-in-one-sprint-5e60e70a557) on how and where sprints can go wrong. An incredibly helpful reading is [**Don’t Make Data Scientists Do Scrum**](https://towardsdatascience.com/dont-make-data-scientists-do-scrum-de87bc921a6b) that makes a seasoned and compelling argument explaining why it may not always be the path to follow for Data Science. Wrap up with [__MVP Paradox And Here’s How To Fix Your MVP Before Its Too Late!__](https://hackernoon.com/mvp-paradox-and-what-most-founders-need-to-be-aware-of-3a5f8c3acb76) on how to think about minimum viable products (**MVPs**).
