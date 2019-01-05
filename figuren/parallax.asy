/* Illustrate the concept of parallax and parallactic motion of stars.
 *
 * Anthony G.A. Brown Dec 2018
 */

settings.outformat = "pdf";  
settings.tex = "pdflatex";  
settings.prc = false;  
settings.render = 0;

import three;
import math;

size(10cm, 0);

pen thickp = linewidth(0.5mm);
pen defaultp = linewidth(0.3mm);
pen thinp = linewidth(0.2mm);
real radius = 3.0;
real lambda = 60.0, beta = 70.0, distance = 8;
real lambdaG1 = lambda-90, betaG=0;
real lambdaG2 = lambdaG1+180;

triple star = distance*dir(90-beta, lambda);
triple Gaia1 = radius*dir(90-betaG, lambdaG1);
triple Gaia1a = radius*dir(90-betaG, lambdaG1+90);
triple Gaia2 = radius*dir(90-betaG, lambdaG2);
triple Gaia2a = radius*dir(90-betaG, lambdaG2+90);

real dfrac = 0.2;
triple plxell1 = star+dfrac*distance*dir(Gaia1--star);
triple plxell1a = star+dfrac*distance*dir(Gaia1a--star);
triple plxell2 = star+dfrac*distance*dir(Gaia2--star);
triple plxell2a = star+dfrac*distance*dir(Gaia2a--star);

// Define projection as perspective projection from given camera standpoint
real rcam = 5.0;
real alphacam = 35.0;
real deltacam = 25.0;
triple camera = rcam*dir(90-deltacam, alphacam);
//currentprojection = perspective(10*camera);
currentprojection = orthographic(10*camera);

draw(circle(O, radius), thickp);
dot(scale(2)*Label("$S$", 0.5, 2*E), star, linewidth(3mm));
dot(Gaia1, linewidth(5mm));
dot(Gaia2, linewidth(5mm));

draw(Gaia1--star, thickp);
draw(star--plxell1, thickp);
//draw(Gaia1a--star);
//draw(star--plxell1a);
draw(Gaia2--star, thickp);
draw(star--plxell2, thickp);
//draw(Gaia2a--star);
//draw(star--plxell2a);
path3 plxell = plxell1..plxell1a..plxell2..plxell2a..cycle;
draw(plxell, thickp);

draw(scale(2)*Label("$b$", 0.4, 2*LeftSide), O--star, dashed+thickp);
draw(scale(2)*Label("1 AU", 0.2, 3*N+E), Gaia1--Gaia2, dashed+thickp);
dot(O, orange+linewidth(12mm));

draw(scale(2.0)*Label("$\varpi$", 0.4, 2*S+2*W), arc(star, star+1.5*dir(star--O), star+1.5*dir(star--Gaia1)), thickp);
