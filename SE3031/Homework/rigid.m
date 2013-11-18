function dz = rigid(t,z)
% dz = zeros(4,1);    % a column vector
% dz(1) = z2;
% dz(2) = z3;
% dz(3) = z4;
% dz(4) + 5*(1 - z1) * z4 + 2*z3 + 3*z2 + z1^3 = 10*sin(pi*t);

dz = [z2; z3; z4; ...
    10*sin(pi*t) - 5*(1 - z1)*z4 - 2*z3 - 3*z2 - z1^3];