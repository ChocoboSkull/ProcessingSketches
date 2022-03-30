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

    for (GridPoint point : points)
    {
        point.Draw();

        for (int d = 0; d < point.randDepth; d++) 
        {
            point.DrawCurveVertex(d);
        }
    }

    save("frame.png");
}

class GridPoint 
{
    float x, y, tileWidth, tileHeight;
    ArrayList<GridPoint> points = new ArrayList<GridPoint>();
    int randDepth = (int) random(1,8); 

    int[][] randIntY = new int[8][8];

    GridPoint(float _x, float _y, float _tw, float _th)
    {
        x = _x;
        y = _y; 
        tileWidth = _tw; 
        tileHeight = _th;

        for (int d = 0; d < randDepth; d++) 
        {
            for (int i = 0; i < randIntY.length; i++) 
            {
                randIntY[d][i] = (int)random(10,tileHeight-(tileHeight/10));
            }
        }
    }

    void Draw()
    {       
        rect(x,y,tileWidth,tileHeight);
    }

    void DrawCurveVertex(int d)
    {
            beginShape();
                curveVertex(x, y + randIntY[d][0]);
                curveVertex(x, y + randIntY[d][1]);
                curveVertex(x + (tileWidth/2), y + randIntY[d][2]);
                curveVertex(x + tileWidth, y + randIntY[d][3]);
                curveVertex(x + tileWidth, y + randIntY[d][4]);
            endShape();
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

