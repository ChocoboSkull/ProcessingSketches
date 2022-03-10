void setup()
{
    size(800,800);
    background(0);
    stroke(#f1f1f1);
    strokeWeight(13);
    noFill();
}

void draw()
{    
    translate(400, 500);
    
    // Center, downwards
    triangle(0, 250, 250, -200, -250, -200);     
    
    // Left, upwards
    triangle(-160, -395, -10, -95, -310, -95);
    
    //Right, upwards
    triangle(160, -395, 310, -95, 10, -95);
    
    save("frame.png");
}