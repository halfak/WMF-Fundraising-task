=========================
Fundraising Modeling Task
=========================

This project contains code and instructions for completing the Wikimedia Foundation's task for new Research Scientists.

To complete the task, clone this repository, edit ``task.R`` to implement an improved test function and submit a pull request to this repositiory or email your solution to ahalfaker@wikimedia.org.


The Problem
===========

The Fundraising team at the Wikimedia Foundation needs to be able to accurately model the donated dollars per banner impression in order to choose the banners that will encourage the highest value.  In other words, the team would like to maximize the number of $ per impression.

But modeling the number of dollars per impression is hard.  The vast majority of impressions (~99.9%) do not lead to a donation.  Due to this strong skew in the data, a simple T test won't serve the teams needs (as is demonstrated in ``task.R``).  

The Task
========

Your job is to write an improved test.  A skeletion of the function ``my_test()`` is provided in ``task.R``.  You're also provided with ``run_test_suite()``, a function that when provided a set of test functions will simulate sample draws from a population in order to determine when.

