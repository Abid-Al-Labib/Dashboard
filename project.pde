import org.gicentre.utils.stat.*;
BarChart AverageFuelEconomy_chart;
BarChart FuelConsumption_chart;
PImage img;
int i =-1;
String d = "";
int first = 1;
float [] economy = {};
float [] avgeconomy = {};
float [] consumption = {};
direction direct = new direction();
SensorDataProvider data = new SensorDataProvider() ;
FuelTank tank = new FuelTank();
TripComputer tc = new TripComputer();
Gauge gaugeRPM = new Gauge();
Gauge gaugespeed = new Gauge();
Gauge gaugefl = new Gauge();
Gauge display = new Gauge ();
fuelcomputer fc = new fuelcomputer();
int RPM;
float fuellevel, ratio, x, y, totaldistance;

void setup()
{
  size (1000, 700);
  background(0);

  AverageFuelEconomy_chart= new BarChart(this);
  AverageFuelEconomy_chart.setMinValue(0);
  AverageFuelEconomy_chart.setMaxValue(30);
  AverageFuelEconomy_chart.showValueAxis(true);
  AverageFuelEconomy_chart.setValueFormat("#");
  AverageFuelEconomy_chart.showCategoryAxis(true);
  AverageFuelEconomy_chart.setBarColour(color(150, 100, 0));
  AverageFuelEconomy_chart.setBarGap(2);

  FuelConsumption_chart= new BarChart(this);
  FuelConsumption_chart.setMinValue(0);
  FuelConsumption_chart.setMaxValue(30);
  FuelConsumption_chart.showValueAxis(true);
  FuelConsumption_chart.setValueFormat("#");
  FuelConsumption_chart.showCategoryAxis(true);
  FuelConsumption_chart.setBarColour(color(150, 100, 0));
  FuelConsumption_chart.setBarGap(2);
}

void draw()
{ 
  if (i==-1 || i == data.dataTable.getRowCount()-1)
  {
    background(0); 
    textSize(20);
    fill(255);
    text("choose:", 100, 300, 30) ;
    text("1.car   2.truck    3.exit", 100, 400, 30) ;
    if (key=='1'||key=='2'||key=='3')
    {
      i=0;
    }
  } else
  { 
    background(0);
    image(img, 410, 0, 180, 220);
    RPM = data.readRPM(i);
    fuellevel = data.readFuelLevel(i);
    ratio = data.readRatio(i); 
    float speed = tc.getCurrentSpeed(RPM, ratio);
    tc.TotalDistance(speed);
    x = data.readX(i);
    y = data.readY(i);

    if (i==0)
    {
      d = "";
    } else 
    {
      direct.xcor = data.readX(i)-data.readX(i-1);
      direct.ycor = data.readY(i)-data.readY(i-1);

      d = direct.CompassDirection (direct.xcor, direct.ycor);
    }
    direct.displaycompass(500, 510, d);
    tank.setfuellevel(fuellevel);
    gaugeRPM.setcurrentvalue(RPM);
    gaugeRPM.display(data.dataTable.getRowCount(), 155, 170, 200, "RPM");
    gaugespeed.setcurrentvalue(speed);  
    gaugespeed.display(data.dataTable.getRowCount(), 840, 170, 200, "speed: KM/H");
    gaugefl.setcurrentvalue(fuellevel);
    gaugefl.display(data.dataTable.getRowCount(), 500, 300, 150, "fuel : liters");
    float fuelconsumed = tank.getconsumedfuel(i);       
    fc.calculatefueleconomy(speed, fuelconsumed);
    float x= fc.fueleconomy;
    economy = append(economy, x);
    fc.calculateAverageEconomy(economy);
    fc.calculateFuelConsumption();
    float v = fc.fuelconsumption;
    consumption = append(consumption, v);
    fc.calculaterange(fuellevel);
    avgeconomy = append(avgeconomy, fc.averagefueleconomy); 
    AverageFuelEconomy_chart.setData(avgeconomy);
    avgeconomy= updatearray (avgeconomy);

    consumption=updatearray (consumption);
    FuelConsumption_chart.setData(consumption);

    display.displaybars(); 
    display.displaytext(220, 220, 220, 220, 550, 590, 510, 620, tc.totalTravelledDistance, fc.fuelconsumption, fc.fueleconomy, fc.range);     
    if (data.readNext(i))
    {
      i++;
    }
    tank.setcurrentlevel(fuellevel);
    if (i==data.dataTable.getRowCount()-1)
    {
      key = '5';
    }
  }
}

void keyPressed()
{
  frameRate(10);
  if (key == '1')
  {
    img = loadImage("logo.jpg");
    data.filepath = "car_status_BMW_323i.csv";
    data.Initialize();
    tank.tankcapacity = 60 ;
    tc.radius = (0.23);
  }
  if (key == '2')
  {
    img = loadImage("logo1.jpg");
    data.filepath = "car_status_Truck_F150.csv";
    data.Initialize();
    tank.tankcapacity = 80 ;
    tc.radius = (0.254);
  }
  if (key == '3')
  {
    exit();
  }
}

float [] updatearray (float [] a )
{
  float [] b= new float [40];
  if (i<40)
    return a;
  else
  {
    for (int k=0, j=1; k<40; k++, j++) {

      b[k]=a[j];
    }
    return b;
  }
}
