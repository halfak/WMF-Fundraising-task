# Fundraising Modeling Task


This project contains code and instructions for completing the Wikimedia Foundation's task for new Research Analyst.

To complete the task, read the following problem description and edit ``task.R`` as needed. Submit your solution to ahalfaker@wikimedia.org.


## The Problem


The Fundraising team at the Wikimedia Foundation needs to be able to accurately model the donated dollars per banner impression in order to choose the banners that will encourage the highest value.  In other words, the team would like to maximize the number of $ per impression.

But modeling the number of dollars per impression is hard.  The vast majority of impressions (~99.9%) do not lead to a donation.  Due to this strong skew in the data, a simple T test will not serve the team's needs (as is demonstrated in ``task.R``).

### Histogram of donation amounts

![histogram](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Fundraising.donations.histogram.svg/500px-Fundraising.donations.histogram.svg.png)


### Histogram (log scaled) of donation amounts

![log-scaled histogram](https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Fundraising.donations.histogram.log_scaled.svg/500px-Fundraising.donations.histogram.log_scaled.svg.png)



## The Task

Your job is to write an improved test.  A skeleton of the function ``my_test()`` is provided in ``task.R``.  You are also provided with ``run_test_suite()``, a function that when provided a set of test functions will simulate sample draws from a population and apply your test function.  The test suite will determine how often your 95% confidence intervals correspond to reality and report the results of the test.  

