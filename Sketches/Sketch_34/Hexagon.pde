class Hexagon 
{
    float centerX;
    float centerY;
    float radius;
    float strokeWeight = 0;
    color strokeColour;
    float angle = TWO_PI / 6;
    boolean fill = false;
    color fillColour;
    boolean depthCheck = true;
    int depthLevel = 1;
    float hexRadiusDirection = random(1,2);

    Hexagon( float x, float y, float r )
    {
        centerX = x;
        centerY = y;
        radius = r;

        if (depthCheck == true)
        {
            depthLevel = (int) random(1,5);
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

        for(int d = 0; d <= depthLevel; d++)
        {
            beginShape();
                for (float a = PI/6; a < TWO_PI; a += angle) 
                {
                    if (hexRadiusDirection <= 1.5)
                    {
                        // Small to large
                        float sx = centerX + cos(a) * (radius*(d*0.25));
                        float sy = centerY + sin(a) * (radius*(d*0.25));
                        vertex(sx, sy);
                    }
                    else
                    {
                        // Large to small
                        float sx = centerX + cos(a) * (radius*(1.05 - (d*0.25)));
                        float sy = centerY + sin(a) * (radius*(1.05 - (d*0.25)));
                        vertex(sx, sy);
                    }

                }
            endShape(CLOSE);
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