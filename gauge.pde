class Gauge
{

  float currentValue;

  void setcurrentvalue(int value)
  {

    currentValue = value;
  }

  void setcurrentvalue(float value)
  {
    currentValue = value;
  }

  void display(int z, float x, float y, float size, String units)
  { 

    stroke(255);
    textFont(createFont("DS-Digital", 36));
    textSize(50);
    fill(0);
    ellipse(x, y, size+100, size+100);
    fill(255);
    textAlign(CENTER, CENTER);
    text(nf(currentValue, 0, 1), x-20, y);
    textSize(20);
    text(units, x-30, y+size-10);
  }
  void displaybars()
  {
    AverageFuelEconomy_chart.draw(350, 460, 300, 200);
    FuelConsumption_chart.draw(700, 410, 260, 250);
    textSize(12);
    text("Average fuel economy", 440, 680);
    text("Fuel Consumption History", 820, 680);
  }

  void displaytext(float x1, float x2, float x3, float x4, float y1, float y2, float y3, float y4, float odo, float fc, float fe, float range )
  {
    stroke(255);
    fill(0, 255, 0);
    textSize(20);
    text("odometer : ", 100, 550);
    text("Fuel Economy : ", 100, 590);
    text("Fuel Consumption : ", 100, 510);
    text("Range : ", 100, 620);
    textSize(15);
    text(nf(odo, 0, 2), x1, y1);
    text(nf(fe, 0, 2), x2, y2);
    text(nf(fc, 0, 2), x3, y3);
    text(nf(range, 0, 2), x4, y4);
    textSize(10);
    text("km", x1+55, y1);
    text("km/litre", x2+55, y2);
    text("litre/100Km", x3+55, y3);
    text("km", x4+55, y4);
    //AverageFuelEconomy_chart.draw(350,480,300,200);
    //FuelConsumption_chart.draw(700,425,260,250);
  }
}
