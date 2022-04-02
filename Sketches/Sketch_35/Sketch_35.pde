//Lets define our array of hexagon objects globally
Hexagon[] hexagons;
ArrayList<GridPoint> points = new ArrayList<GridPoint>();
float tileWidth = 100, tileHeight = 100;
int hexRadius=60;
int gridCount = 0;

void setup()
{
    //fullScreen(P2D);
    background(0);
    smooth();
    
    size(820,820);



    for (float x = 0; x < (width - 20); x += tileWidth) 
    {
        for (float y = 0; y < (height - 20); y += tileHeight) 
        {
            points.add(new GridPoint(x, y, tileWidth, tileHeight));
            gridCount++;
        }
    }
    
    randomlySubdivideGridPoints();

/*
    hexagons=new Hexagon[16];
    //Manually define each new hexagon object's coordinates and radius
    hexagons[0] = new Hexagon(width/4, height/4, hexRadius);
    hexagons[1] = new Hexagon(width/2, height/2, hexRadius);
    hexagons[2] = new Hexagon(3*width/4, 3*height/4, hexRadius);
    hexagons[3] = new Hexagon(width/4, height/4, hexRadius*0.75);
    hexagons[4] = new Hexagon(width/2, height/2, hexRadius*0.75);
    hexagons[5] = new Hexagon(3*width/4, 3*height/4, hexRadius*0.75);
    hexagons[6] = new Hexagon(width/4, height/4, hexRadius*0.5);
    hexagons[7] = new Hexagon(width/2, height/2, hexRadius*0.5);
    hexagons[8] = new Hexagon(3*width/4, 3*height/4, hexRadius*0.5);
    hexagons[9] = new Hexagon(width/4, height/4, hexRadius*0.25);
    hexagons[10] = new Hexagon(width/2, height/2, hexRadius*0.25);
    hexagons[11] = new Hexagon(3*width/4, 3*height/4, hexRadius*0.25);
    hexagons[12] = new Hexagon(width/4, height/4, hexRadius*0.05);
    hexagons[13] = new Hexagon(width/2, height/2, hexRadius*0.05);
    hexagons[14] = new Hexagon(3*width/4, 3*height/4, hexRadius*0.05);
*/

    hexagons=new Hexagon[gridCount];

    for (int i=0; i<points.size(); i++)
    {
        hexagons[i] = new Hexagon(points.get(i).x + points.get(i).tileWidth/2, points.get(i).y + points.get(i).tileHeight/2, (points.get(i).tileWidth * 0.6) * 0.75);
    }
}

void randomlySubdivideGridPoints () 
{
    ArrayList<GridPoint> newPoints = new ArrayList<GridPoint>();
    gridCount = 0;
    
    for (GridPoint p : points)
    {
        if (random(1) > 0.5) 
        {
            p.Subdivide(newPoints);
        } 
        else 
        {
            newPoints.add(p);
            gridCount++;
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
        //hexagons[i].setFillColour(255);
        hexagons[i].draw(); //Cycle though our short array and call the draw function
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

