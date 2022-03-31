Hexagon[] hexagons;
ArrayList<GridPoint> points = new ArrayList<GridPoint>();
float tileWidth = 100, tileHeight = 100;
int hexRadius=60;
int gridCount = 0;

void setup()
{ 
    size(820,820);

    for (float x = 0; x < (width - 20); x += tileWidth) 
    {
        for (float y = 0; y < (height - 20); y += tileHeight) 
        {
            points.add(new GridPoint(x, y, tileWidth, tileHeight));
            gridCount++;
        }
    }
    
    hexagons=new Hexagon[gridCount];

    for (int i=0; i<points.size(); i++)
    {
        hexagons[i] = new Hexagon(points.get(i).x + tileWidth/2, points.get(i).y + tileHeight/2, hexRadius * 0.75);
    }
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

    noFill();
    stroke(255);
    strokeWeight(1);

    for( int i=0; i<hexagons.length; i++ )
    {
        hexagons[i].setStroke(1,255);
        hexagons[i].draw();
    }

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
    int randDepth = (int) random(1,5); 

    GridPoint(float _x, float _y, float _tw, float _th)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;
    }

    void Draw()
    {       
        rect(x,y,tileWidth,tileHeight);
    }

    void Subdivide(ArrayList<GridPoint> pointsBefore)
    {
        points = pointsBefore;

        for (float w = 0; w <= 1; w++) 
        {
            for (float h = 0; h <=1; h++) 
            {
                points.add(new GridPoint(x + ((tileWidth/2) * w), y + ((tileHeight/2) * h), tileWidth/2, tileHeight/2));
                gridCount++;
            }
        }
    }
}

