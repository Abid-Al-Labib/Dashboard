class fuelcomputer
{
  float fueleconomy;
  float fuelconsumption;
  float fueleconomyhistory;
  float averagefueleconomy;
  float totalfuelconsumed;
  float range;

  void calculatefueleconomy(float speed, float fuelconsumed)
  {
    if (fuelconsumed==0)
    {
      fueleconomy=0;
    } else {
      fueleconomy = (speed/3600) / fuelconsumed;
    }
  }

  void totalfuelconsumed(float fuel)
  {
    if (i<60)
    {
      totalfuelconsumed = totalfuelconsumed + fuel;
    } else {
      totalfuelconsumed=0;
    }
  }

  void calculateAverageEconomy(float [] a)
  {
    float sum=0;   
    if (i <60)
    {
      int counter;
      for ( counter = 0; counter <=i; counter++)
      {
        sum= sum + a[counter];
      }
      averagefueleconomy = sum/(i+1);
    } else
    {
      int counter;
      for ( counter = (i-60); counter <= i; counter++)
      {
        sum = sum + a[counter];
      }
      averagefueleconomy = (sum/60);
    }
  }

  void calculateFuelConsumption()
  {
    if (averagefueleconomy==0)
      fuelconsumption=0;
    else
      fuelconsumption = ((1/averagefueleconomy)*100);
  }
  void calculaterange(float remaining)
  {
    range =(averagefueleconomy*remaining);
  }
}
