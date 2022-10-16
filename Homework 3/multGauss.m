function sum_graph = multGauss(gauss, domain)

number_of_graphs = size(gauss,1);

if size(gauss, 2) == 3 
    for n = 1:number_of_graphs
        amplitude = gauss(n,1);
        width = gauss(n, 2);
        location = gauss(n, 3);
        sum_graph(n,:) = (gaussmf(domain, [width location])* amplitude);
    end
elseif size(gauss, 2) > 3
        disp("You have too many arguments");
else size(gauss, 3) < 3
        disp("You have too few arguments");
end