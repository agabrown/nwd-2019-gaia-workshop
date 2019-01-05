/* Illustrate the meaning of the (ICRS) coordinates of a star on the sky.
 *
 * Anthony G.A. Brown Jan 2019
 */

settings.outformat = "pdf";  
settings.tex = "pdflatex";  
settings.prc = false;  
settings.render = 0;

import three;
import math;
import solids;

size(15cm, 0);

pen thickp = linewidth(0.5mm);
pen defaultp = linewidth(0.3mm);
pen thinp = linewidth(0.2mm);
real radius = 3.0;
real alpha = 58.0, delta = 55.0;

// Define projection as perspective projection from given camera standpoint
real rcam = 5.0;
real alphacam = 35.0;
real deltacam = 25.0;
triple camera = rcam*dir(90-deltacam, alphacam);
//currentprojection = perspective(10*camera);
currentprojection = orthographic(10*camera);

// XYZ axes
real r = 3.5;
pen redpen = defaultp+rgb(0.7,0,0);
draw(Label("$X$",1),O--r*X,redpen,Arrow3);
draw(Label("$Y$",1),O--r*Y,redpen,Arrow3);
draw(Label("$Z$",1),O--r*Z,redpen,Arrow3);
label("$O$",O,W+0.5*N);
label("`Noorden'",radius*Z,align=Relative(2.5*W+2*N));

// Sky sphere
revolution skysphere = sphere(O,radius);
draw(skysphere, 1);

// Add meridian trough +Z and +X
path3 meridian_front = arc(O,radius*Z,radius*X,Y);
draw(meridian_front,defaultp);

// Draw a point on the celestial sphere with an arrow pointing towards it.
triple dirS = dir(90-delta,alpha);
triple pS = radius*dirS;
triple pAux = radius*dir(10,alpha);
draw(arc(O,radius*Z,pS),thickp);
draw(arc(O,pS,(pS.x,pS.y,0)),thickp+dashed);
draw(O--dirS, thickp, Arrow3(10pt));
draw(scale(1.5)*Label("$S$",1,align=Relative(1.5*E+0.5*N)), O--pS, thickp+dotted);
draw(O--(pS.x,pS.y,0),thinp+dashed);
draw((pS.x,pS.y,0)--pS,thinp+dashed);
draw((pS.x,0,0)--(pS.x,pS.y,0),thinp+dashed);
draw((0,pS.y,0)--(pS.x,pS.y,0),thinp+dashed);
label("`Evenaar'",r*X,align=Relative(2.5*S+15*E));

// arc indicating angle alpha between meridians 0 and alpha
draw(arc((0,0,pAux.z),rotate(-alpha,Z)*pAux,pAux),thickp+blue);

// arc indicating angle alpha in xy-plane
draw(scale(1.5)*Label("$\alpha$",0.5),arc(O,0.5*unit((pS.x,0.0,0.0)),0.5*unit((pS.x,pS.y,0.0))),thickp+blue);

// arc indicating angle delta in meridian plane
draw(scale(1.5)*Label("$\delta$",0.5,align=Relative(E+N)),arc(O,0.7*unit(pS),0.7*unit((pS.x,pS.y,0.0))),thickp+blue);

// indicate barycentric distance b
label(scale(1.5)*Label("$b$"), 0.45*pS, align=Relative(1*E));
