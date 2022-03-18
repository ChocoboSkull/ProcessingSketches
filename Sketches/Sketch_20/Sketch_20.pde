ArrayList<GridPoint> points = new ArrayList<GridPoint>();
float tileWidth = 100, tileHeight = 100;

void setup()
{
    size(820,820);

    for (float x = 0; x < (width - 20); x += tileWidth) 
    {
        for (float y = 0; y < (height - 20); y += tileHeight) 
        {
            points.add(new GridPoint(x, y, tileWidth, tileHeight));
        }
    }
}

void draw()
{    
    background(0);
    translate(10, 10);

    stroke(155);
    strokeWeight(1);
    noFill();

    rect(0, 0,800,800);

    for (GridPoint point : points)
    {
        point.Draw();
    }

    save("frame.png");
}

class GridPoint 
{
    float x, y, tileWidth, tileHeight;
    int randInt = (int) random(4);

    GridPoint(float _x, float _y, float _tw, float _th)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;
    }

    void Draw()
    {
        fill(255);

        noStroke();
        switch (randInt) 
        {
            case 0:
                triangle(x, y, x + tileWidth, y, x + tileWidth, y + tileHeight);
            break;

            case 1:
                triangle(x, y + tileHeight, x, y, x + tileWidth, y);
            break;

            case 2:
                triangle(x, y, x, y + tileHeight, x + tileWidth, y + tileHeight);
            break;

            case 3:
                triangle(x, y + tileHeight, x + tileWidth, y + tileHeight, x + tileWidth, y);
            break;
        }

    }
}

