class Tile 
{
    float centerX;
    float centerY;
    float tileWidth;
    float tileHeight;
    float strokeWeight = 0;
    color strokeColour;
    float angle = TWO_PI / 6;
    boolean fill = false;
    color fillColour;
    boolean depthCheck = false;
    int depthLevel = 1;
    int tileVariant = (int) random(0,2);

    Tile( float _x, float _y, float _tw, float _th)
    {
        centerX = _x;
        centerY = _y;
        tileWidth = _tw;
        tileHeight = _th;

        if (depthCheck == true)
        {
            depthLevel = (int) random(1,6);
        }
    }
 
    void draw() 
    {
        if(fill)
        {
            fill(fillColour);
        }
        else
        {
            noFill();
        }

        if(strokeWeight==0)
        {
            noStroke();
        }
        else
        {
            strokeWeight(strokeWeight);
            stroke(strokeColour);
        }

        switch (tileVariant)
        {
            case 0:
                arc(centerX + tileWidth/2, centerY, tileWidth * 0.2, tileHeight * 0.2, radians(90), radians(270));
                arc(centerX - tileWidth/2, centerY, tileWidth * 0.2, tileHeight * 0.2, radians(270), radians(450));

                arc(centerX, centerY - tileHeight/2, tileWidth * 0.2, tileHeight * 0.2, radians(0), radians(180));
                arc(centerX, centerY + tileHeight/2, tileWidth * 0.2, tileHeight * 0.2, radians(180), radians(360));
            break;

            case 1:
                line(centerX - tileWidth/2, centerY - (tileHeight * 0.1), centerX + tileWidth/2, centerY - (tileHeight * 0.1));
                line(centerX - tileWidth/2, centerY + (tileHeight * 0.1), centerX + tileWidth/2, centerY + (tileHeight * 0.1));

                line(centerX - (tileWidth * 0.1), centerY - tileHeight/2, centerX - (tileWidth * 0.1), centerY + tileHeight/2);
                line(centerX + (tileWidth * 0.1), centerY - tileHeight/2, centerX + (tileWidth * 0.1), centerY + tileHeight/2);
            break;

            case 2:
                line(centerX - tileWidth/2, centerY, centerX, centerY);
                line(centerX, centerY - tileHeight/2, centerX, centerY);

                line(centerX, centerY + tileHeight/2, centerX + tileWidth/2, centerY);
            break;
        }
    }
 
    float centerX()
    {
        return centerX;
    }
 
    float centerY()
    {
        return centerY;
    }
 
    color getColour()
    {
        return fillColour;
    }
  
    void setFillColour(color col)
    {
        fill = true;
        fillColour = col;
    }
  
    void setNoFill(boolean yesno)
    {
        fill = yesno;
    }

    void setStroke(float weight, color col)
    {
        strokeWeight = weight;
        strokeColour = col;
    }
}