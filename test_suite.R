library(data.table)

run_test_suite = function(tests,
                          observations = 100000,
                          probdonate = 0.00089,
                          iterations = 10000,
                          verbose = FALSE){
	
	
	# Simulate trials
	results = data.table()
	
	for(i in 1:iterations){
		
		population.donations = generate_donations(round(observations*probdonate))
		real_mean = probdonate * mean(population.donations)
		
		# how many donations?
		numdonate = rbinom(1, observations, probdonate)
		
		# how many zeros?
		zeros = observations - numdonate
		
		# sample donation amounts
		donations = sample(population.donations, numdonate, replace = TRUE)
		
		# perform test
		for(test in tests){
			model = test$func(zeros, donations)
			spread = model$upper_95 - model$lower_95
			hit = model$lower_95 < real_mean & model$upper_95 > real_mean
			results = rbind(
				results,
				data.table(
					test = test$name,
					i = i,
					hit = hit,
					spread = spread
				)
			)
		}
		
		if(verbose){
			for(t in tests){
				with(
					results[
						test==t$name,
						list(
							n = length(i),
							hit_rate = mean(hit),
							mean_spread = mean(spread)
						),
					],
					cat(
						t$name, " -- ",
						"Hit rate: ", hit_rate, ", ", 
						"Mean spread: ", mean_spread, "\n", 
						sep=""
					)
				)
			}
		}
	}
	
	results[,
		list(
			iterations = length(hit),
			hits = sum(hit),
			misses = sum(!hit),
			spread.mean = mean(spread)
		),
		test
	][,
		list(
			test,
			iterations,
			hits,
			misses,
			hit_rate.lower_95 = round(min(prop.test(hits, iterations)$conf.int), 3),
			hit_rate.observed = round(hits/iterations, 3),
			hit_rate.upper_95 = round(max(prop.test(hits, iterations)$conf.int), 3),
			spread.mean = round(spread.mean, 4)
		)
	]
}

generate_donations = function(n){
	distribution = c(
		rep(3, 400),
		rep(5, 250),
		rep(10, 240),
		rep(20, 110),
		rep(30, 90),
		rep(50, 50),
		rep(100, 20)
	)
	
	sample(distribution, n, replace = TRUE)
}

