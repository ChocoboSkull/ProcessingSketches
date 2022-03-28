

ArrayList<GridPoint> points = new ArrayList<GridPoint>();
float tileWidth = 100, tileHeight = 100;
int starPointInc = 0;

void setup()
{
    size(820,820);

    for (float x = 0; x < (width - 20); x += tileWidth) 
    {
        for (float y = 0; y < (height - 20); y += tileHeight) 
        {
            points.add(new GridPoint(x, y, tileWidth, tileHeight, starPointInc));
            starPointInc++;
        }
    }
    
    //randomlySubdivideGridPoints();
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
    int randInt = (int) random(16);
    int starPoint;

    GridPoint(float _x, float _y, float _tw, float _th, int _sp)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;
        starPoint = _sp;
    }

    void Draw()
    {
        noFill();
        stroke(255);
        strokeWeight(1);
        
        rect(x,y,tileWidth,tileHeight);
        star(x + tileWidth / 2, y + tileHeight/2, (tileWidth/2) * 0.2, (tileWidth/2) * 0.8, 2 + starPoint);    
    }

    void Subdivide(ArrayList<GridPoint> pointsBefore)
    {
        points = pointsBefore;

        for (float w = 0; w <= 1; w++) 
        {
            for (float h = 0; h <=1; h++) 
            {
                points.add(new GridPoint(x + ((tileWidth/2) * w), y + ((tileHeight/2) * h), tileWidth/2, tileHeight/2, starPoint));
            }
        }
    }

    void star(float x, float y, float radius1, float radius2, int npoints) 
    {
        float angle = TWO_PI / npoints;
        float halfAngle = angle/2.0;

        beginShape();

        for (float a = 0; a < TWO_PI; a += angle) 
        {
            float sx = x + cos(a) * radius2;
            float sy = y + sin(a) * radius2;
            vertex(sx, sy);
            sx = x + cos(a+halfAngle) * radius1;
            sy = y + sin(a+halfAngle) * radius1;
            vertex(sx, sy);
        }

        endShape(CLOSE);
    }
}

