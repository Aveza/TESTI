function [U, K] = osc_energy(u, v, omega)
    U = (1/2)*omega.^2*u.^2;
    K = (1/2)*v.^2;
end