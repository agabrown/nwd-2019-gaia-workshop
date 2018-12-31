/* Illustrate the concept of parallax in a simplified manner.
 *
 * Anthony G.A. Brown Dec 2018
 */

settings.outformat = "pdf";  
settings.tex = "pdflatex";  
settings.prc = false;  
settings.render = 0;

import math;

size(10cm, 0);

pen thickp = linewidth(0.5mm);
pen defaultp = linewidth(0.3mm);
pen thinp = linewidth(0.2mm);
real radius = 3.0;
real distance = 8.0;

pair star = (0,distance);
pair Gaia1 = (-radius, 0);
pair Gaia2 = (radius, 0);

path plxtriangle = (0,0) -- Gaia1 -- star -- Gaia2 -- cycle;

draw(plxtriangle, thickp);
draw(scale(2)*Label("$s$", 0.4, 2*LeftSide), (0,0) -- star, thickp+dashed);
dot(scale(2)*Label("$S$", 0.5, 2*E), star, linewidth(3mm));
dot(Gaia1, linewidth(5mm));
dot(Gaia2, linewidth(5mm));
dot((0,0), orange+linewidth(12mm));

draw(scale(2)*Label("1 AU", 0, N), (0.5*radius,0));
draw(scale(2.0)*Label("$\varpi$", 0.5, 2*S), arc(star, star+1.5*dir(star--(0,0)), star+1.5*dir(star--Gaia2)), thickp);
