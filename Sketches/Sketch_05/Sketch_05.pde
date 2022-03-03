void setup()
{
    size(800,800);
    background(0);
}

void draw()
{
    background(0);
    fill(0);
    rect(0, height, width, height/2);
    fill(255);
    
    push();
        translate(width/2, 150);

        // Animation
        rotate(radians(frameCount));

        for (int i = 9; i > 0; i--) 
        {
            fill(255);

            ellipse(0, 75+((9-i) * 60), 5 * i, 5 * i);
        }
    pop();

    ellipse(width/2, 150, 50, 50);

    if (frameCount < 361)
    {
        saveFrame("frames/Frame-###.png");
    }
    
}