void setup()
{
    size(800,800);
}

void draw()
{
    background(0);
    rectMode(CENTER);
    stroke(#f1f1f1);
    strokeWeight(4);
    noFill();

    rect(400, 400, 600, 600);

    save("frame.png");
}