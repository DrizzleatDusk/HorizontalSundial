size(20cm, 0);

int draw_scale(int density, real latitude){
	/* Draw scales of horizontal sundial.
	   density: scales per hour.
       latitude: local latitude. */
	if (density < 1 || density > 10)	return -1;
  	if (latitude < 5. || latitude > 90.)		return -1;
  	pair O = (0,0);
  	pair A;
  	int n = 24 * density;
  	real delta, theta;
  	Label l;
  
  	draw(unitcircle, black+.7pt);
 	draw(scale(.95)*unitcircle, black+.7pt);
  	for (int i = 0; i < 24; ++i){
      	for (int j = 0; j < density; ++j){
          	delta = 15 * (i + j/density);
          	theta = aTan(Tan(delta) / Sin(latitude));
          	if (delta > 90 && delta < 270)		theta += 180; 
          	A = (Cos(theta),Sin(theta));
          	if (j == 0){
              	l = Label(format("$%d$",(18-i)%24), position=EndPoint, black);
              	draw(O--A, red+.7pt, L=l);
            }
          	else{
              	draw(.5*A--.99*A, blue);
            }
        }    
      
    }
  	return 0;
}


draw_scale(4, 40);