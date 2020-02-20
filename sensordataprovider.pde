class SensorDataProvider
{
  String filepath;
  Table dataTable;
  int currentIndex;

  void Initialize()
  {
    dataTable = loadTable (filepath, "header");
  } 

  boolean readNext(int z)
  {
    if (z<(dataTable.getRowCount()-1))
    {
      return true;
    } else {
      return false;
    }
  }

  int readRPM(int z)
  {
    TableRow row;
    row = dataTable.getRow(z) ;
    return row.getInt("RPM");
  }

  float readFuelLevel(int z)
  {
    TableRow row;
    row = dataTable.getRow(z) ;
    return row.getFloat("Fuel Level (liter)");
  }

  float readRatio(int z)
  {
    TableRow row;
    row = dataTable.getRow(z) ;
    return row.getFloat("Gear Ratio");
  }

  float readX(int z)
  {
    TableRow row;
    row = dataTable.getRow(z) ;
    return row.getFloat("X");
  }

  float readY(int z)
  {
    TableRow row;
    row = dataTable.getRow(z) ;
    return row.getFloat("Y");
  }
}
