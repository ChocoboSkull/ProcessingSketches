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

    for (GridPoint point : points)
    {
        point.Draw();
    }

    save("frame.png");
}

class GridPoint 
{
    float x, y, tileWidth, tileHeight;

    GridPoint(float _x, float _y, float _tw, float _th)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;
    }

    void Draw()
    {
        stroke(255);
        strokeWeight(1);
        noFill();
        rect(x, y, tileWidth, tileHeight);
        fill(255);
        ellipse(x + (tileWidth/2), y + (tileHeight/2), 10, 10);
    }
}

