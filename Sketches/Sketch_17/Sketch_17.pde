float bottomBuffer_T1 = 100, leftBuffer_T1 = 100, rightBuffer_T1 = 100;


void setup()
{
    size(800,800);
}

void draw()
{    
    noStroke();
    background(0);
     
    fill(255);
    bufferedTri(height, width, bottomBuffer_T1, leftBuffer_T1, rightBuffer_T1);


    push();
        fill(0);
        translate(157, 250);
        scale(0.4);
        bufferedTri(height, width, bottomBuffer_T1, leftBuffer_T1, rightBuffer_T1);
    pop();

    stroke(0);
    strokeWeight(60);
    line(0, height-275, width, height-275);
      
    save("frame.png");
}

void bufferedTri (float areaHeight, float areaWidth, float bottomBuffer, float leftBuffer, float rightBuffer)
{
    triangle(leftBuffer, areaHeight - bottomBuffer, areaWidth - rightBuffer, areaHeight - bottomBuffer, (leftBuffer + areaWidth - rightBuffer) / 2, (areaHeight -bottomBuffer) -(0-leftBuffer + areaWidth - rightBuffer) * sin(60 * (PI/180)));
}