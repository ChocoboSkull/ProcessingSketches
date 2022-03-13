float length = 400;
int depth = 1;
int base = 6;

void setup() 
{
    size(800, 800);
    noFill();
}

void draw() 
{
    background(0);
    stroke(255);

    if (frameCount < 10)
    {
        sierpinskiFractal(width / 4, height - 300, length, depth, frameCount);
        saveFrame("frames/Frame-###.png");
    }
    else
    {
        sierpinskiFractal(width / 4, height - 300, length, depth, base);
    }


}

void sierpinskiFractal (float x, float y, float length, int depth, int base)
{
    if (depth == base)
    {
        calcTriangle(x, y, length);
    } 
    else 
    {
        calcTriangle(x, y, length);
        sierpinskiFractal(x, y, length / 2, depth + 1, base);
        sierpinskiFractal(x + length / 4, y - sin(PI / 3) * length / 2, length / 2, depth + 1, base);
        sierpinskiFractal(x + length / 2, y, length / 2, depth + 1, base);
    }
}

void calcTriangle (float x, float y, float length)
{
    triangle(x, y, x + length / 2, y - sin(PI / 3) * length, x + length, y);
}
