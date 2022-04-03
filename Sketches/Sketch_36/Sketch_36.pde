Tile[] tiles;
ArrayList<GridPoint> gridList = new ArrayList<GridPoint>();
float gridWidth = 100, gridHeight = 100;
int gridCount = 0;

void setup()
{
    size(820,820);

    for (float x = 0; x < (width - 20); x += gridWidth) 
    {
        for (float y = 0; y < (height - 20); y += gridHeight) 
        {
            gridList.add(new GridPoint(x, y, gridWidth, gridHeight));
            gridCount++;
        }
    }

    tiles=new Tile[gridCount];

    for (int i=0; i<gridList.size(); i++)
    {
        tiles[i] = new Tile(gridList.get(i).x + gridList.get(i).gridWidth/2, gridList.get(i).y + gridList.get(i).gridHeight/2, gridWidth, gridHeight);
    }
}

void draw()
{    
    background(0);
    noFill();
    translate(10, 10);

    for( int i=0; i<tiles.length; i++ )
    {
        tiles[i].setStroke(1,255);
        tiles[i].draw();
    }

    for (GridPoint point : gridList)
    {
        //point.Draw();
    }

    save("frame.png");
}

class GridPoint 
{
    float x, y, gridWidth, gridHeight;
    ArrayList<GridPoint> gridList = new ArrayList<GridPoint>();

    GridPoint(float _x, float _y, float _gw, float _gh)
    {
        x = _x;
        y = _y; 
        gridWidth = _gw; 
        gridHeight = _gh;
    }

    void Draw()
    {       
        rect(x,y,gridWidth,gridHeight);
    }
}

