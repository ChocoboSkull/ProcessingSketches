void setup()
{
    size(800,800);
    background(0);
}

void draw()
{
    strokeWeight(2);
    fill(0);

    // Ring effect
    for (int i = 8; i > 0; i--)
    {
        ellipse(400, 400, 100*i, 100*i);
    } 

    noFill();

    stroke(255);

    // Grid effect
    for (int i = 1; i <= 20; i++) 
    {
        strokeWeight(i * 1.25);

        int lineX = i * 40;
        line(lineX, 0, lineX, height);
    }

    save("frame.png");
}