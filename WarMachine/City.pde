
//The rectanglular "buildings" at the bottom of the screen and the crossHair that connects them.
class City {
  private float crossHairX, crossHairY;
  private float crossHairRadius;
  private ArrayList<Building> buildings; //all of the buildings in the city

  City(float cityWidth, float cityHeight, int numberOfBuildingsInTheCity) {

    //create and init the buildings
    buildings = new ArrayList<Building>();
    
    //init parameters for the buildings based on the total city's width&height
    float buildingWidth = cityWidth/16;
    float buildingHeight = cityHeight/32;
    float buildingYCoordinate = cityHeight - cityHeight/12;
    color buildingColor = color(55); //all gray buildings for now..
    float offset = cityWidth/10; //offset between each building

    //populate the buildings on the city's left half
    for (int i = 0; i < numberOfBuildingsInTheCity/2; i++) {
      float buildingXCoordinate = (i * cityWidth/8) + offset;
      Building building = new Building(buildingXCoordinate, buildingYCoordinate, buildingWidth, buildingHeight, buildingColor);
      buildings.add(building);
    }

    //then then buildings on the city's right half
    for (int i = 0; i < numberOfBuildingsInTheCity/2; i++) {
      float buildingXCoordinate = cityWidth - (i * cityWidth/8 ) - offset - (cityWidth/16);      
      Building building = new Building(buildingXCoordinate, buildingYCoordinate, buildingWidth, buildingHeight, buildingColor);
      buildings.add(building);
    }

    //setup the crossHair
    crossHairRadius = cityWidth/40;
  }

  public void draw() {
    
    //Draw the buildings, as well as the guide lines that run from each building to the crossHair's center
    for (int i = 0; i < buildings.size(); i++) { 
      //draw the buildings
      Building currentBuilding = buildings.get(i);

      //draw the lines from this building to the crossHair
      strokeWeight(2);
      stroke(255);
      line(currentBuilding.x + currentBuilding.width/2, currentBuilding.y + currentBuilding.height/2, crossHairX, crossHairY);
      
      //then draw the building itself
      currentBuilding.draw();

    }

    //Then draw the crosshair retical
    stroke(random(0, 255));
    point(crossHairX, crossHairY);
    
    fill(255, 0, 0, 0);
    strokeWeight(2);
    ellipse(crossHairX, crossHairY, crossHairRadius, crossHairRadius);
  }

  public void setCrossHairX(float x) {
    crossHairX = x;
  }
  public void setCrossHairY(float y) {
    crossHairY = y;
  }
  
  public float getCrossHairX() {
    return crossHairX;
  }
  
  public float getCrossHairY() {
    return crossHairY;
  }

  /*
  Helper class: buildings in the city. 
  Just a colored rectangle but it might be fun to add more building state (for things like building destruction or different draw modes)
  */
  private class Building {
    float x, y, width, height;
    color buildingColor;

    Building(float x, float y, float buildingWidth, float buildingHeight, color buildingColor) {
      this.x = x;
      this.y = y;
      this.width = buildingWidth;
      this.height = buildingHeight;
      this.buildingColor = buildingColor;
    }

    void draw() {
      noStroke();
      fill(buildingColor);
      //rect(x+random(2), y+random(2), width+random(2), height+random(2)); //fun jitter... 
      //also fun to have the building position/size relate to the crossHair position
      rect(x,y,width,height);
    }
  }
}
