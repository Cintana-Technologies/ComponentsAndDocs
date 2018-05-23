//To use the declared module in another file, an import keyword is used as given below. The file name is only specified no extension used.

import shape = require("./iShape"); 
import circle = require("./Circle"); 
import triangle = require("./triangle");  

function drawAllShapes(shapeToDraw: shape.IShape) {
   shapeToDraw.draw(); 
} 

drawAllShapes(new circle.Circle()); 
drawAllShapes(new triangle.Triangle()); 


