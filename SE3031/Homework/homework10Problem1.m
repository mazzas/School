function dy = homework10Problem1( t,y )
    dy(1) = 5*y(2); 
    dy(2) = -5*y(1) - y(2); 
    dy = dy';
end