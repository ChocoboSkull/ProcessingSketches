

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
    
    randomlySubdivideGridPoints();
    randomlySubdivideGridPoints();
}

void randomlySubdivideGridPoints () 
{
    ArrayList<GridPoint> newPoints = new ArrayList<GridPoint>();
    
    for (GridPoint p : points)
    {
        if (random(1) > 0.5) 
        {
            p.Subdivide(newPoints);
        } 
        else 
        {
            newPoints.add(p);
        }
    }
    
    points = newPoints;
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
    ArrayList<GridPoint> points = new ArrayList<GridPoint>();
    int randInt = (int) random(8);
    int randDepth = (int) random(1,6);
    int randFill = (int) random(2);

    GridPoint(float _x, float _y, float _tw, float _th)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;
    }

    void Draw()
    {
        noFill();
        noStroke();

        for (int i = 0; i < randDepth; ++i) 
        {
            if ((i + randFill) % 2 == 0) 
            {
                fill(255);          
            } 
            else 
            {
                fill(0);
            }

            switch (randInt)
            {
                case 0:
                    arc(x, y, tileWidth*2 - (i * (tileWidth/5)), tileHeight*2 - (i * (tileHeight/5)), 0, HALF_PI);
                break;

                case 1:
                    arc(x + tileWidth, y, tileWidth*2 - (i * (tileWidth/5)), tileHeight*2 - (i * (tileHeight/5)), HALF_PI, PI);
                break;

                case 2:
                    arc(x + tileWidth, y + tileHeight, tileWidth*2 - (i * (tileWidth/5)), tileHeight*2 - (i * (tileHeight/5)), PI, PI+HALF_PI);
                break;

                case 3:
                    arc(x, y + tileHeight, tileWidth*2 - (i * (tileWidth/5)), tileHeight*2 - (i * (tileHeight/5)), PI+HALF_PI, TWO_PI);
                break;

                case 4:
                    triangle(x + (i * (tileWidth/5)), y, x + tileWidth, y, x + tileWidth, y + tileHeight - (i * (tileHeight/5)));
                break;

                case 5:
                    triangle(x, y + tileHeight - (i * (tileHeight/5)), x, y, x + tileWidth - (i * (tileWidth/5)), y);
                break;

                case 6:
                    triangle(x, y + (i * (tileHeight/5)), x, y + tileHeight, x + tileWidth - (i * (tileWidth/5)), y + tileHeight);
                break;

                case 7:
                    triangle(x + (i * (tileWidth/5)), y + tileHeight, x + tileWidth, y + tileHeight, x + tileWidth, y + (i * (tileHeight/5)));
                break;
            }
        }
    }

    void Subdivide(ArrayList<GridPoint> pointsBefore)
    {
        points = pointsBefore;

        for (float w = 0; w <= 1; w++) 
        {
            for (float h = 0; h <=1; h++) 
            {
                points.add(new GridPoint(x + ((tileWidth/2) * w), y + ((tileHeight/2) * h), tileWidth/2, tileHeight/2));
            }
        }
    }
}

