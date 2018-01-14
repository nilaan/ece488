function xdot = MassSpringDamper(t, x, u, M, B, K)
xdot(1) = x(2);
xdot(2) = u/M-B/M*x(2)-K/M*x(1);
xdot = xdot';
end