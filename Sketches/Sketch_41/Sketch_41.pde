PGraphics mask;
int WHITE = color(255);
int BLACK = color(0);
float numLines = 100;
float amplitude = 40;
float maskRadius = 700;
float noisePos;
float gapX;
float gapY;


void setup() 
{
    size(800, 800);
    colorMode(HSB);
    stroke(WHITE);
    background(WHITE);

    noisePos = random(100);
    gapX = width / numLines;
    gapY = height / numLines;
    drawMask();
    
    fill(BLACK);
}

void draw() 
{
    for (int i = -4; i < (numLines + 8); i++) 
    {
        beginShape();
            vertex(-2 * gapX, ((numLines * amplitude * 2) + i * gapY));
            vertex(-2 * gapX, (i * gapY));

            for (int j = -2; j <(numLines + 6); j++) 
            {
                float theta = map(noise(noisePos, i * 0.1, j * 0.02), 0, 1, 0, TWO_PI);
                float x = (cos(theta) * amplitude) + (j * gapX) ;
                float y = (sin(theta) * amplitude) * 1.5 + (i * gapY);
       
                curveVertex(x, y);
            }
     
            vertex((numLines + 6) * gapX, (i * gapY));
            vertex((numLines + 6) * gapX, ((numLines * amplitude * 2) + i * gapY));
        endShape(CLOSE);
    }
    
    noisePos += 0.03;

    maskPixels();

    if (frameCount <= 60)
    {
        saveFrame("frames/Frame-###.png");
    }
}

void drawMask() 
{
    mask = createGraphics(width, height);
    mask.beginDraw();
        mask.background(0);
        mask.ellipse(width/2, height/2, maskRadius, maskRadius);
    mask.endDraw();
    mask.loadPixels();
}

void maskPixels() 
{
    loadPixels();

    for (int i=0; i < mask.pixels.length; ++i) 
    {
        int maskPixel = mask.pixels[i];

        if (maskPixel != WHITE) 
        {
            pixels[i] = BLACK;
        }
    }
    
    updatePixels();
}