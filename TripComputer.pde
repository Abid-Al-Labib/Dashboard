class TripComputer
{
  float totalTravelledDistance;
  float radius;
  float speed;


  float getCurrentSpeed(int RPM, float gearRatio)
  {
    speed = (RPM/60)*(1/gearRatio)*(2*PI*radius);
    speed = speed * 3.6;
    return speed;
  }

  void TotalDistance(float s)
  {
    {
      totalTravelledDistance= ((totalTravelledDistance)+(s/3600));
    }
  }
}
