void setup()
{
    size(800,800);
    background(0);
}

void draw()
{
    stroke(255);
    strokeWeight(2);

    noFill();
    translate(400, 400);

    circle(3,100);
    circle(4,150);
    circle(5,200);
    circle(6,250);
    circle(7,300);
    circle(8,350);

    save("frame.png");
}

void circle(int points, float radius)
{
    beginShape();

    for (int i=0; i<points; i++)
    {
        float angle = -PI/2+float(i)*TWO_PI/float(points);
        vertex( radius*cos(angle), radius*sin(angle) );
    }

    endShape(CLOSE);
}