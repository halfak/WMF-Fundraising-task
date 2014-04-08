source("test_suite.R")

library(ggplot2)

observations = 1000000
probdonate = 0.00089

donations = generate_donations(round(probdonate*observations))
zeros = observations - length(donations)

g = ggplot(
	data.table(
		foo = "bar",
		donation_amount = c(rep(0, zeros), donations)
	)[,
		list(count = length(foo)),
		list(donation_amount)
	],
	aes(
		x = donation_amount,
		y = count
	)
) + 
geom_bar(stat="identity") + 
scale_x_continuous("Dollar amount", breaks=c(0, unique(donations))) + 
theme_bw()

svg("donation.histogram.log_scaled.svg", height=5, width=7)
g + scale_y_log10("Donations (log scaled)")
dev.off()

svg("donation.histogram.svg", height=5, width=7)
g + scale_y_continuous("Donations")
dev.off()

