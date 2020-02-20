class FuelTank
{
  float tankcapacity;
  float fuellevel;
  float currentlevel;
  float remaining;

  void setfuellevel(float a)
  {

    fuellevel=a;
  }

  void setcurrentlevel( float a)
  {
    currentlevel = a;
  }

  float getconsumedfuel(int index )
  {
    float consumed;
    if (index==0)
    {
      consumed = 0;
    } else
    {
      consumed = currentlevel - fuellevel;
    }
    return consumed;
  }

  void setremainingfuel()
  {
    remaining = fuellevel-(currentlevel-fuellevel);
  }
}
