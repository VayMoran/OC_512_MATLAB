domain = 0:0.1:20;

sum_graph = multGauss([0.1 0.5 2; 0.5 1 4; 1 2 6; 2 3 8], domain)
plot(domain, sum_graph)