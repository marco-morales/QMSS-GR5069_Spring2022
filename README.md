# QMSS GR5069 - APPLIED DATA SCIENCE FOR SOCIAL SCIENTISTS

<br/>

__Instructor:__ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [__Marco Morales__](mailto:marco.morales@columbia.edu), Columbia University\
__Co-Instructor:__ &nbsp; [__Nana Yaw Essuman__](mailto:nanayawce@gmail.com), Columbia University


__TAs:__ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[__Ludovico Genovese__](mailto:lg3148@columbia.edu), Columbia University\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[__Prerit Jain__](mailto:pj2383@columbia.edu), Columbia University\
<br/>



This repository is a companion to the course [__Applied Data Science for Social Scientists__](https://vergil.registrar.columbia.edu/#/courses/QMSSG5069_001_2022_1) taught at the [__Quantitative Methods in the Social Sciences__](http://qmss.columbia.edu/) program over the Spring of 2022.

It contains curated reference materials, slides and sample code. You can find the most updated version of the course syllabus [here](/syllabus/GR5069_Spring2022.pdf). Make sure to check regularly for updates.


## Overview

In his now classic [Venn diagram](http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram), [Drew Conway](https://en.wikipedia.org/wiki/Drew_Conway) described **Data Science** as sitting at the intersection between **good hacking skills**, **math / statistics knowledge**, and **substantive expertise**. Standard quantitative training in the social sciences supplies a fluid combination of all three, but tailored to **understanding human behavior**, and to **explaining why things happen the way they do**. Social scientists are, thus, a particular kind of data scientist.

This course is a collection of topics that fill very specific gaps identified over the years on what a social scientist should know at minimum when entering Data Science, and what a data scientist should be skilled at to add immediate value to their teams.

To do that, this course aims to:
* teach processes and practices at the **intersection of Data Science and Data Engineering** that are central to the **data product cycle**. Data Scientists typically start being exposed to Data Engineering on the job. There's much to be gained from early exposure to concepts and practices in this field;

* sharpen technical skills not only in **fitting models**, but particularly in **building knowledge and generating insights** from the data. While this may seem obvious for a Data Scientist, it is not always the focus of training,

* train in **working effectively in teams** to build projects and products. Data Science is collaborative in nature and constantly evolving in **best practices** that enhance efficient collaboration. Collaboration for school projects/assignments is vastly different from the **highly-structured collaboration** that happens in DS teams, but is not always the focus of training, and

* enhance **soft skills** that are key to a successful interaction with business stakeholders. The most important - and often neglected - activity of a data scientist is to obtain expert knowledge from and communicate with non-technical audiences. The greatest insight/project/product is moot if no one outside the Data Science team understands it or its value.

All of these are highly valued skills in the Data Science job market, but not always considered explicitly as part of an integral Data Science curriculum.

## Prerequisites:

It is assumed that students have basic to intermediate knowledge of object-oriented programming - e.g [**R**](https://www.r-project.org/) or [__Python__](https://www.python.org) - including experience using it for data manipulation, visualizations, and model estimation. Some mathematics, statistics and algebra are also assumed.


## Course Roadmap

```
outline\
| -- week  1 : OVERVIEW: DS & DE PERSPECTIVES
| -- week  2 : WORKSHOP - VERSION CONTROL & GitHub
| -- week  3 : WORKSHOP - SETTING UP PROJECTS: DS & DE PERSPECTIVES
| -- week  4 : WORKSHOP - CODING ETIQUETTE
| -- week  5 : WORKSHOP - DATA PIPELINE IN PRACTICE
| -- week  6 : MISSING DATA & DATA QUALITY
| -- week  7 : MODEL DEPLOYMENT & VERSIONING,
               WORKING ENVIRONMENTS (DEV, STAGING, PROD)
| -- week  8 :       -- ACADEMIC HOLIDAY --
| -- week  9 : WORKSHOP - INTERACTIVE WORKING SESSION
| -- week 10 : EXPLANATION v PREDICTION
| -- week 11 : MODEL EVALUATION
| -- week 12 : DATA VISUALIZATION
| -- week 13 : WORKFLOW COLLABORATION
| -- week 14 : PRESENTING RESULTS
```

## Course Resources

There are no required textbooks for this course. The course will rely on a combination of curated reading materials, in-class workshops and take-home exercises that will leverage the following tools:
* __Slack__
* __GitHub / GitHub classroom__
* __AWS Academy Learner Labs__
* __Databricks__

## To actively participate on this course

Make sure to have the latest versions of [__R__](https://www.r-project.org/)/[__RStudio__](https://www.rstudio.com/), and/or [__Anaconda__](https://www.anaconda.com/distribution/), as well as [__git__](https://git-scm.com/) installed on your computer. Sign up for a [__GitHub__](https://github.com) account if you don't have one already. [__Atom__](https://atom.io/) is  recommended to simplify your interaction with git and GitHub.

Registered students will receive instructions to access __GitHub classroom__, __Slack__, __AWS Academy__, and __Databricks__.


### Accessing course materials in this repo

1. install [**git**](https://git-scm.com/downloads) in your local machine

2. from the command line, go to the directory where you want to clone this repo

	```
	$ cd <dir>
	```

3. `clone` this repository to get a local copy in your machine

	```
	$ git clone https://github.com/marco-morales/QMSS-GR5069_Spring2022.git
	```

4. `pull` every week before class to sync your local copy with the lates changes pushed to the repo

	```
	$ git pull origin main
	```

5. "Watch" the repository to get notifications each time updates are pushed
