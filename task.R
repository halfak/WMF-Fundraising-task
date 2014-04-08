source("test_suite.R")


# My test function
# 
# Write a function that takes a count of the number of non-donating impressions
# an a vector of donation amounts.  Return a list with three named values:
# * expected = best guess at the mean, 
# * upper_95 = upper 95% confidence interval, 
# * lower_95 = lower 95% confidence interval
#
# :Parameters:
#     zeros      int  
#         The count of the number of non-donating impressions
#     donations  vector of int
#         The non-zero donation amounts from the test
#
#
# :Return:
#     A list a values (expected, upper_95, lower_95)
#
my_test = function(zeros, donations){
	# Implement your test here
}


# Sample t.test function
#
# This function fails to accurately model the donation ammounts.  The confidence
# intervals end up surrounding the true mean only ~93% of the time.
#
mean_t_test = function(zeros, donations){
	values = c(rep(0, zeros), donations)
	
	t.model = t.test(values)
	
	list(
		expected = t.model$estimate,
		upper_95 = t.model$conf.int[2],
		lower_95 = t.model$conf.int[1]
	)
}

# Run the test suite and print the results.  
results = run_test_suite(
	list(
		list(name="t.test", func=mean_t_test) # Add your test to this list. 
	),
	iterations=1000, # Number of iterations to perform.  1k good for dev.  Use 10k for final.
	verbose=T # Prints the results of each iteration. Set to F to reduce terminal noise
)
print(results)
