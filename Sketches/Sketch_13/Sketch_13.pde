void setup()
{
    size(800,800);
    stroke(#f1f1f1);
    strokeWeight(13);
    noFill();
}

void draw()
{    
    background(0);
    translate(400, 400);
    
    // Right, downwards
    push();
        fill(#f1f1f1);
        triangle(-75, -50, 75, 250, 225, -50);
    pop();
    
    // Left, upwards
    push();
        blendMode(DIFFERENCE);
        triangle(-225, 50, -75, -250, 75, 50);
    pop();
      
    save("frame.png");
}