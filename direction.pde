class direction
{
  float xcor;
  float ycor;

  String CompassDirection(float x, float y)
  {
    String d="";

    if (x>0 &&y>0)
      d= "NE";
    else if (x>0 &&y<0)
      d= "SE";
    else if (x<0 && y>0)
      d= "NW";
    else if (x<0 &&y<0)
      d= "SW";
    else if (x==0 &&y>0)
      d= "N";
    else if (x==0 &&y<0)
      d= "S";
    else if (x>0 &&y==0)
      d= "E";
    else if (x<0 &&y==0)
      d= "W";

    return d;
  }

  void displaycompass(float x, float y, String d)
  {


    stroke(10);
    strokeWeight(5);
    noFill();
    ellipse(x, y, 70, 70);

    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text(d, x, y);
  }
}    
