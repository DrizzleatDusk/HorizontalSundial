settings.outformat = "pdf";
settings.prc = false;
size(20cm, 0);
import three;

// Basic frame
real r = 2;
real h = 1.5 * r;
real beta = 50;
real delta = 20;
triple O = (0,0,0);
triple E = (0,r,0);
triple N = (0,0,h);
triple Q = (-r*Sin(delta),r*Cos(delta),0);
label("$O$", O, align=S);
label("$\mathcal{N}$", N, align=N);
label("$E\;18$", E, align=E);
label("$W\;6$", -E, align=W);
label("$Q$", Q, align=NE);

draw((0,-r,0)--(0,r,0));
path3 sunlight = N--Q;
draw(O--N, dashed);
draw(sunlight, yellow);
draw(N--E, yellow);
surface equator = scale3(r) * unitdisk;
surface ground = rotate(beta, O, E) * equator;
draw(equator, red+opacity(.2));
draw(ground, black+opacity(.3));
triple P = intersectionpoints(sunlight, ground)[0];
label("$P$", P, align=E);
path3 vecground = O--P;
path3 vecequator = O--Q;
draw(vecequator);
draw(vecground);

draw(arc(O,E/4,Q), red, L=Label("$\delta$",position=MidPoint,align=E));
draw(arc(O,E/8,P), red, L=Label("$\theta$",position=MidPoint,align=E));

// Auxiliary lines
triple K = (P.x, P.y, 0);
label("$K$", K, align=NE);
draw(P--K, dashed);

triple H = (0, K.y, 0);
label("$H$", H, align=S);
draw(K--H, dashed);
draw(P--H, dashed);
draw(arc(H,H+(K-H)/4,P), red, L=Label("$\beta$",position=MidPoint,align=NE));