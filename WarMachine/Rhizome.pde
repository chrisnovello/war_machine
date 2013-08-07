/*
Keeps track of all the missiles on the board
Also broadcasts info about oldest missiles and destroyed missiles
*/

class Rhizome {

  private final static int NUMBER_OF_MISSILES_AT_LAUNCH = 0;

  private final static int MAX_NUMBER_OF_MISSILES = 300;
  private ArrayList<Missile> activeMissiles; //the nest of shoots that rain from the sky
  private ArrayList<Circle> collisionZones; //keeps track of zones used to destroy with each update
  private boolean shouldResetTheRhizome = false;
  private Broadcaster broadcaster;
  
  private color rhizomeColor = color(0);
  
  Rhizome(Broadcaster broadcaster) { 

    this.broadcaster = broadcaster;

    activeMissiles = new ArrayList<Missile>();
    for (int i = 0; i < NUMBER_OF_MISSILES_AT_LAUNCH; i++) {
      addMissile();
    }

    collisionZones = new ArrayList<Circle>();
  }

  public boolean updateAndDraw(float delta) {

    if (shouldResetTheRhizome) {
      activeMissiles = new ArrayList<Missile>();
      shouldResetTheRhizome = false;
    }

   boolean somethingExplodedThisPass = false;


    synchronized(activeMissiles) { //because an event thread might want to add missiles..
      //go through the missiles
      for (int i = activeMissiles.size() - 1; i >= 0; i--) {
        Missile missile = activeMissiles.get(i);
  
        //update and draw them
        missile.update(delta);
        missile.setColor(rhizomeColor); //could toggle this for 
        missile.draw();

        //destroy any missiles that are in a collision zone
        for (Circle circle : collisionZones) {
          if (dist(missile.getX(), missile.getY(), circle.x, circle.y) < circle.radius) {

            broadcaster.aMissileExplodedAt(missile.getX(), missile.getY());      
            activeMissiles.remove(i);
            somethingExplodedThisPass = true;
            break; //this missile was deleted, go back to iterating through the missiles
          }
        }
        collisionZones.clear();        
      }

      if (!activeMissiles.isEmpty()) {
        broadcaster.sendOldestMissileCoordinates(activeMissiles.get(0).getX(), activeMissiles.get(0).getY());
      }

      int numberOfMissilesToRemove = activeMissiles.size() - MAX_NUMBER_OF_MISSILES;
      //if there are missiles to prune, then remove old missiles but not the very oldest.. 
      for (int i = numberOfMissilesToRemove; i >= 0; i--) {
        activeMissiles.remove(i);
      }
    }
    
    return somethingExplodedThisPass;
  }

  public void killTheRhizome() {
    shouldResetTheRhizome = true;
  }

  public void addMissile() {
    synchronized(activeMissiles) {
      activeMissiles.add(new Missile());
    }
  }

  public void destroyMissiles(float withinRadiusOf, float x, float y) {
    collisionZones.add(new Circle(x, y, withinRadiusOf));
  }


  public void setColor(color someColor) {
    this.rhizomeColor = someColor;
  }

  private class Circle {
    float x, y, radius;
    Circle(float x, float y, float radius) {
      this.x = x;
      this.y = y;
      this.radius = radius;
    }
  }
}

