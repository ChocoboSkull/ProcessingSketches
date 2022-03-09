float a = 0.0;
float inc = 0.25;

void setup()
{
    size(800,800);
    stroke(255);

}

void draw()
{
    background(0);
    translate(width/4, height / 2);

    for (int i = 0; i < 400; i=i+8) 
    {
        line(i, 0, i, sin(a)*200.0);
        a = a + inc;
    }

    if (frameCount < 97)
    {
        saveFrame("frames/Frame-###.png");
    }
}