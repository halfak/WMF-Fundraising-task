# Fundraising Modeling Task


This project contains code and instructions for completing the Wikimedia Foundation's task for the Research Analyst position.

To complete the task, read the following problem description and edit ``task.R`` as needed. If you are not familiar with R, you can review ``task.R`` and write its code along with your edits in a programming language of your choice. You have 3 business days to work on this task. Please submit your solution (the updated code and a one-page description of how you approached this question and why) to ahalfaker@wikimedia.org. Alternatively, you can share your solution with us as a link to a stand-alone repo (not forked from WMF-Fundraising-task).


## The Problem


The Fundraising team at the Wikimedia Foundation needs to be able to accurately model the donated dollars per banner impression in order to choose the banners that will encourage the highest value.  In other words, the team would like to maximize the number of $ per impression.

But modeling the number of dollars per impression is hard.  The vast majority of impressions (~99.9%) do not lead to a donation (See the histogram below).  Due to this strong skew in the data, a simple T test will not serve the team's needs (as is demonstrated in ``task.R``).

![log-scaled histogram](https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Fundraising.donations.histogram.log_scaled.svg/500px-Fundraising.donations.histogram.log_scaled.svg.png)



## The Task

Your job is to write an improved test.  A skeleton of the function ``my_test()`` is provided in ``task.R``.  You are also provided with ``run_test_suite()``, a function that when provided a set of test functions will simulate sample draws from a population and apply your test function.  The test suite will determine how often your 95% confidence intervals correspond to reality and report the results of the test.  

