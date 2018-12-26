// Illustrate the concepts of proper motion and radial velocity

settings.outformat = "pdf";  
settings.tex = "pdflatex";  
settings.prc = false;  
settings.render = 0;

import math;

size(15cm,0);

pen thickp = linewidth(0.5mm);
pen defaultp = linewidth(0.3mm);
pen thinp = linewidth(0.2mm);

real starangle = 20;
pair star = 8*dir(starangle);
pair vtan = (0,2);
pair vrad = (3,0);
pair vtot = vtan+vrad;

draw(arc((0,0),8,5,40));
draw((0,0)--star, thickp+dashed);
draw(scale(2)*Label("$v_\mathrm{rad}$", 0.5, 2*RightSide), star--(star+rotate(starangle)*vrad), thickp+rgb(0.5,0.5,0.5), Arrow);
draw(scale(2)*Label("$v_\mathrm{tan}$", 0.8, 2*RightSide), star--(star+rotate(starangle)*vtan), thickp+rgb(0.5,0.5,0.5), Arrow);
draw(scale(2)*Label("$v$", 0.6, RightSide), star--(star+rotate(starangle)*vtot), thickp, Arrow);
dot(star, linewidth(3mm));

draw(scale(2)*Label("$O$"), (0,0), S);
draw(scale(2)*Label("$S$"), star, 2*S);

draw(star+rotate(starangle)*vrad -- star+rotate(starangle)*vtot, thickp+dotted);
draw(star+rotate(starangle)*vtan -- star+rotate(starangle)*vtot, thickp+dotted);
