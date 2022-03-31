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

    Hexagon( float x, float y, float r )
    {
        centerX = x;
        centerY = y;
        radius = r;
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
  
        beginShape();
            for (float a = PI/6; a < TWO_PI; a += angle) 
            {
                float sx = centerX + cos(a) * radius;
                float sy = centerY + sin(a) * radius;
                vertex(sx, sy);
            }
        endShape(CLOSE);
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