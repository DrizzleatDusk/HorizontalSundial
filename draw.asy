settings.outformat = "pdf";
size(20cm, 0);

real l_CB = 11;
real l_CD = 8;
real laltitude = 35;

pair C = (0, 0);
pair A = (C.x-l_CB, 0);
pair B = (C.x+l_CB, 0);
fill(box((-12,-1),(12,16)), white);
label("$A$", A, S);
label("$B$", B, S);
path horizontal1 = A--B;
draw(horizontal1);
pair D = l_CD * (Cos(laltitude+90), Sin(laltitude+90));
label("$C$", C, S);
label("$D$", D, W);
draw(C--D, dashed);
pair E_ = (0, l_CD/Cos(laltitude));
label("$E$", E_, NW);
draw(D--E_, dashed);
path horizontal2 = (0.9*A.x, E_.y)--(0.9*B.x, E_.y);
draw(horizontal2);
real r = arclength(D--E_);
pair O = (0, E_.y+r);
label("$O$", O, NW);
draw(C--O);
draw(arc(O, r, -170, -10));

real[] angle_array = {-45, -30, -15, 30, 45, 60};
pair[] inters_array;
string[] label_array = {"$F$", "$K$", "$I$", "$J$"};
for (int i = 0; i < 6; ++i){
  pair inters = (r*Tan(angle_array[i]), E_.y);
  inters_array[i] = inters;
  draw(O--inters, dashed);
  if (i > 1){
    if (i > 2)
      label(label_array[i-2], inters, NE);
    else
      label(label_array[i-2], inters, NW);
  }
}
for (int i = 0; i < 5; ++i){
  if (i == 3)
    draw(C--(r*Tan(15),E_.y));
  draw(C--inters_array[i]);
}

pair I_ = inters_array[4];
pair L = (I_.x, 0);
label("$L$", L, S);
draw(I_--L);
draw(E_--L, dashed);
pair M = (I_.x/2, E_.y/2);
label("$M$", M, E);
label("$G$", intersectionpoint(C--inters_array[3], E_--L), E);
pair H1 = L.x * (1, Tan(30)/Sin(laltitude));
pair H = intersectionpoint(C--H1, E_--L);
//dot(H);
label("$H$", H, E);
draw(C--H1);
draw(H1--inters_array[5], dashed);
draw(I_--H, dashed);
pair H2 = L.x * (1, Tan(15)/Sin(laltitude));
draw(C--H2);

draw((-I_.x,I_.y)--(-L.x,L.y));
draw(C--(-H1.x,H1.y));
draw(C--(-H2.x,H2.y));
