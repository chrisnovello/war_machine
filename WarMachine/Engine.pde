
/*
 Glue. Has a city, a rhizome (cluster of missiles), and an array of explosions.
 Creates explosions at the positions of the city's crossHairs. 
 Tells the rhizome to destroy missiles at explosion locations
 */
class Engine {
  City city; //a set of buildings and a crosshair
  final static int NUMBER_OF_BUILDINGS_IN_THE_CITY = 6;

  Rhizome rhizome; //the dense nest of raining missiles
  ArrayList<Explosion> explosions; //and the explosions that love them
  private boolean somethingExplodedLastPass = false;

  int maxExplosionSize = 40; //when new explosions are created, what is the current explosion size that was set externally?

  //what draw mode is the game in? at the moment this only affects explosions but it could be nice to modify more broadly
  int drawMode = 0;  
  int numberOfDrawModes = 2;
  
  color skyColor = color(133);

  Engine() {
    city = new City(width, height, NUMBER_OF_BUILDINGS_IN_THE_CITY);
    rhizome = new Rhizome(new Broadcaster());
    explosions = new ArrayList<Explosion>();
  }

  public void updateAndDraw(float delta) {

    synchronized(explosions) { //because an event thread might try to make new explosions..
      //go through each explosion
      for (int i = explosions.size() - 1; i >= 0; i--) { //but count from size to zero because you might remove items from the arraylist
        Explosion explosion = explosions.get(i);
        //destroy any missiles in the rhizome within radius of the explosion
        rhizome.destroyMissiles(explosion.getRadius(), explosion.getX(), explosion.getY());

        //then update and draw each explosion
        explosion.update(delta);
        explosion.draw(drawMode);

        if (explosion.isFinishedExploding()) {
          explosions.remove(i);
        }
      }
    }

    boolean somethingExploded = rhizome.updateAndDraw(delta);
    if(somethingExploded) {
      skyColor = color(random(255), random(255), random(255));
    } else {
     skyColor = color(133); 
    }
    
    city.draw();
  }



  public void setCrossHairX(float x) {
    city.setCrossHairX(x);
  }
  public void setCrossHairY(float y) {
    city.setCrossHairY(y);
  }

  public color getSkyColor() {
    return skyColor;
  }


  public void killAllMissiles() {
    rhizome.killTheRhizome();
  }

  public void addMissile() {
    rhizome.addMissile();
  }
  
  public void setColorOfAllMissiles(color colorToUse) {
   rhizome.setColor(colorToUse);
  }

  public void addExplosionAtCrossHair() {
    synchronized(explosions) {
      explosions.add(new Explosion(city.getCrossHairX(), city.getCrossHairY(), maxExplosionSize));
    }
  }

  public void addExplosionAtCoordinate(float x, float y, color withColor) {
    Explosion explosion = new Explosion(x, y, maxExplosionSize);
    explosion.setColor(withColor);
    synchronized(explosions) {
      explosions.add(explosion);
    }
  }
  
  public void setMaxExplosionSize(int maxExplosionSize) {
    this.maxExplosionSize = maxExplosionSize;
  }

  public void nextDrawMode() {
    if (drawMode < numberOfDrawModes - 1) { //indexed from zero
      drawMode++;
    } 
    else {
      drawMode = 0;
    }
  }

}

