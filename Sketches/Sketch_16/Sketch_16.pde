float bottomBuffer_T1 = 100, leftBuffer_T1 = 100, rightBuffer_T1 = 100;
float bottomBuffer_T2 = 100, leftBuffer_T2 = 200, rightBuffer_T2 = 200;

void setup()
{
    size(800,800);

    //stroke(0);
    //strokeWeight(13);
    //noFill();
}

void draw()
{    
    noStroke();
    background(255);
    //translate(400, 400);
    
    //triangle(leftBuffer, height - bottomBuffer, width - rightBuffer, height - bottomBuffer, (leftBuffer + width - rightBuffer) / 2, height -(leftBuffer + width - rightBuffer) * sin(60 * (PI/180)));
    
    fill(0);
    bufferedTri(height, width, bottomBuffer_T1, leftBuffer_T1, rightBuffer_T1);

    fill(255);
    bufferedTri(height, width, bottomBuffer_T2, leftBuffer_T2, rightBuffer_T2);

    stroke(255);
    strokeWeight(60);
    line(width/2, height-bottomBuffer_T1, width, 0);

    // Right, downwards
    //push();
        //fill(#f1f1f1);
        //triangle(-75, -50, 75, 250, 225, -50);
    //pop();
    
    // Left, upwards
    //push();
        //blendMode(DIFFERENCE);
        //triangle(-225, 50, -75, -250, 75, 50);
    //pop();
      
    save("frame.png");
}

void bufferedTri (float areaHeight, float areaWidth, float bottomBuffer, float leftBuffer, float rightBuffer)
{
    triangle(leftBuffer, areaHeight - bottomBuffer, areaWidth - rightBuffer, areaHeight - bottomBuffer, (leftBuffer + areaWidth - rightBuffer) / 2, (areaHeight -bottomBuffer) -(0-leftBuffer + areaWidth - rightBuffer) * sin(60 * (PI/180)));
}