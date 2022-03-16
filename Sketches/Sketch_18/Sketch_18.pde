void setup()
{
    size(800,800);
}

void draw()
{    
    background(0);

    translate(400, 400);

    push();
        fill(255);
        blendMode(DIFFERENCE);

        EquTriRadius (0,0,200);

        rotate(radians(60));
        EquTriRadius (0,0,200);

        rotate(radians(30));
        EquTriRadius (0,0,200);

        rotate(radians(60));
        EquTriRadius (0,0,200);
    pop();


    push();
        noFill();
        stroke(155);
        strokeWeight(1);

        ellipse(0, 0, 400, 400);
        ellipse(0, 0, 200, 200);
    pop();

    save("frame.png");
}

void EquTriRadius (float centerX, float centerY, float radius)
{
    float cX = centerX;
    float cY = centerY - radius;

    float  bX = cX * cos(radians(120)) - (cY * sin(radians(120)));
    float  bY = cX * sin(radians(120)) + (cY * cos(radians(120)));

    float  aX = cX * cos(radians(240)) - (cY * sin(radians(240)));
    float  aY = cX * sin(radians(240)) + (cY * cos(radians(240)));

    triangle(aX, aY, bX, bY, cX, cY);
}