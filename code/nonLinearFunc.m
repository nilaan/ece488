function ydot = nonLinearFunc(f, x, xval, u, uval, tval)
syms t;
ydot = subs(f, x, xval);
ydot = subs(ydot, u, uval);
ydot = subs(ydot, t, tval);
ydot = double(ydot);
ydot = ydot';
end