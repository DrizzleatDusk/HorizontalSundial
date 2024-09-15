settings.outformat = "pdf";
size(9cm);

real H = 1.5;
real beta = 50.;
real alpha = 20.;
pair O = (0,0);
pair P = (0,H);

draw((-3,0)--(1.5,0), arrow=Arrow(TeXHead), L=Label("$x$", position=EndPoint));
draw(O--(0,4.5), arrow=Arrow(TeXHead), L=Label("$z$", position=EndPoint));
label("$O$", O, align=SW);
label("$H$", (0,H), align=E);
draw(O--P, p=linewidth(1.5pt));

pair nk = (Cos(beta), -Sin(beta));
pair npk = (nk.y, -nk.x);
pair nv = (Sin(alpha-beta),-Cos(alpha-beta));
draw((P.x-2,P.y)--P, dashed);
draw((P-3*nk)--P, dashed, arrow=Arrow(), L=Label("$\hat{k}$"));
draw((P-3*nv)--P, lightolive, arrow=Arrow(), L=Label("$\hat{v}$"));
draw((P-1.5*npk)--(P+1.5*npk), dashed+red);

draw(arc(P, P-.4*nk, P-(1,0)), blue, arrow=Arrow(TeXHead), L=Label("$\beta$"));
draw(arc(P, P-.6*npk, P-.5*nv), blue, arrow=Arrow(TeXHead), L=Label("$\alpha$"));
path curv = shift(P-2.5*nk)*rotate(50)*yscale(.4)*arc(O,.3,150,-150);
draw(curv, blue, arrow=Arrow(TeXHead), L=Label("$\delta$",align=.8E));



// for (int i=0; i<24; ++i) {
// 	delta = i * 15.;
//   	denom = Cos(delta)*Cos(alpha)*Cos(beta) + Sin(alpha)*Sin(beta);
//   	if (denom <= 0.)
//       	continue;
// 	x = (-Cos(delta)*Cos(alpha)*Sin(beta) + Sin(alpha)*Cos(beta)) / denom;
//   	y = Sin(delta)*Cos(alpha) / denom;
//   	dot((x,y));
// }