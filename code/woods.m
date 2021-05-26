%%Seyyed Ali Sadat
%%Sasadat@ieee.org
function z=woods(xx)


x1 = xx(1);
x2 = xx(2);
x3 = xx(3);
x4 = xx(4);

term1 = (10 *(x2-x1^2))^2;
term2 = (1-x1)^2;
term3 = 90 * (x4-x3^2)^2;
term4 = (1-x3)^2;
term5 = 10* (x2+x4-2)^2;
term6 = 0.1*(x2-x4);

z = term1 + term2 + term3 + term4 + term5 + term6;
% If you want min put...
z=-z;

end



