void setup() 
{
    size(800,800);
    rectMode(CENTER);
    noStroke();
}

void draw() 
{
    background(0);
    translate(width / 2, height / 2);

    push();
        fill (255);
        rect(0, 0, width * 0.6, height * 0.6);
    pop();

    push();
        blendMode(DIFFERENCE);
        ellipse(width * 0.3, height * 0.3, 300, 300);
        ellipse(0-width*0.3, 0-height *0.3, 300, 300);
    pop();

    save("frame.png");
}