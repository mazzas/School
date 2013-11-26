function [c,ceq]=nonlcon(x)
    c = 0.6^2 - (x(1) - 0.4)^2 - (x(2) - 0.4)^2;
    ceq = [];
end

