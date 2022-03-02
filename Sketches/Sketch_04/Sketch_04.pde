void setup()
{
    size(800,800);
    background(0);
}

void draw()
{    
    // set the sketches background to black
    background(0);

    // center rectangles in general
    rectMode(CENTER);

    // set the stroke properties
    stroke(#f1f1f1);
    strokeWeight(4);
     
    // transparent
    noFill();

    // open a new matrix
    push();

        // translate it to the center
        translate(400, 400);
     
        // defines parameters for the triangle
        float x1 = 0;
        float y1 = -300;
        float x2 = 300;
        float y2 = 300;
        float x3 = -300;
        float y3 = 300;
     
        // draw the triangle
        triangle(x1, y1, x2, y2, x3, y3);
     
    // close the matrix
    pop();
 
    // draw the circle
    ellipse(400, 515, 363, 363);

    save("frame.png");
}