/* Illustrate the concepts of proper motion and radial velocity
 *
 * Anthony G.A. Brown Dec 2018
 */

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
pair vtan = (0,3);
pair vrad = (2,0);
pair vtot = vtan+vrad;
pair endposrel = vtot*1.8;
pair starendpos = star+rotate(starangle)*endposrel;

draw(arc((0,0),8,5,50));
draw((0,0)--star, thinp+dashed);
draw((0,0)--starendpos, thinp+dashed);
draw(scale(2)*Label("$\mathbf{v}_\mathrm{rad}$", 0.5, 2*RightSide), star--(star+rotate(starangle)*vrad), thickp+rgb(0.5,0.5,0.5), Arrow);
draw(scale(2)*Label("$\mathbf{v}_\mathrm{tan}$", 0.8, 2*RightSide), star--(star+rotate(starangle)*vtan), thickp+rgb(0.5,0.5,0.5), Arrow);
draw(scale(2)*Label("$\mathbf{v}$", 0.6, RightSide), star--(star+rotate(starangle)*vtot), thickp, Arrow);
draw(star--starendpos);
dot(star, linewidth(3mm));
dot(starendpos, linewidth(3mm));

draw(scale(2)*Label("$O$"), (0,0), S);
draw(scale(2)*Label("$\mathbf{b}(0)$"), star, 2*S);
draw(scale(2)*Label("$\mathbf{b}(t)$"), starendpos, 2*E);

draw(star+rotate(starangle)*vrad -- star+rotate(starangle)*vtot, thickp+dotted);
draw(star+rotate(starangle)*vtan -- star+rotate(starangle)*vtot, thickp+dotted);

draw(scale(1.5)*Label("$\mathbf{u}(0)$", 0.8, 2*RightSide), (0,0)--2*unit(star), thickp, Arrow);
draw(scale(1.5)*Label("$\mathbf{u}(t)$", 0.8, 2*LeftSide), (0,0)--2*unit(starendpos), thickp, Arrow);
draw(scale(1.5)*Label("$\Delta\theta$", 0.5, RightSide), arc((0,0), 2*unit(star), 2*unit(starendpos)), Arrow);
