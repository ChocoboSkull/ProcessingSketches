// Made using a tutorial by Daniel Shiffman

// Starting angle
float theta = 0.0;

void setup() 
{
    size(800,400);
}

void draw() 
{
    background(0);

    // theta controls velocity of animation.
    theta += 0.02;

    noStroke();
    fill(255);
    float angle = theta;

    for (int x = 0; x <= width; x += 10) 
    {
        float y = map(sin(angle), -1, 1, 0, height);

        ellipse(x, y, 16, 16);
 
        angle += 0.3;
    }

    if (frameCount < 361)
    {
        saveFrame("frames/Frame-###.png");
    }
}