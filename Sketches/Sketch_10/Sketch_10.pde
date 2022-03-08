float mapValue = 0.0f;
float scaleValue = 0.0f;

void setup() 
{
    size(800,800);
	background(100);
}

void draw() 
{
	background(0);

	for(int i=0;i<10;i++)
    {
		noFill();
        mapValue=map(i,0,10,100,255);
		stroke(mapValue,mapValue,mapValue);
		strokeWeight(3);
		ellipse(width/2.0f, height/2.0f, (float)500-i*50-(sin(scaleValue)*250),(float)500-i*50-(sin(scaleValue)*250));
		
	}

    scaleValue += 0.05f;

    // Guestimate for loop.
    if (frameCount < 127)
    {
        saveFrame("frames/Frame-###.png");
    }
}