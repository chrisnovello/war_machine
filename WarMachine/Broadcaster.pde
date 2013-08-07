//Broadcaster wraps outgoing OSC messagess 
//A loose effort to keep the OSC implementation out of the game models..
class Broadcaster {

  public void aMissileExplodedAt(float x, float y) {
    //Send an OSC message
    //Set X and Y for recently exploded missile
    OscMessage myMessage = new OscMessage("/"+name+"/ExplodedMissileX");
    float scaled = map(x, 0, RES_WIDTH, 0.0, 1.0);
    myMessage.add(scaled);
    oscP5.send(myMessage, myRemoteLocation);

    myMessage = new OscMessage("/"+name+"/ExplodedMissileY");
    scaled = map(y, 0, RES_HEIGHT, 0.0, 1.0);
    myMessage.add(scaled);
    oscP5.send(myMessage, myRemoteLocation);

    //and notify of an explosion
    myMessage = new OscMessage("/"+name+"/MissileExploded");
    myMessage.add(1.0);
    oscP5.send(myMessage, myRemoteLocation);
  } 

  public void sendOldestMissileCoordinates(float x, float y) {
    
    OscMessage myMessage = new OscMessage("/"+name+"/OldestMissileX");
    float scaled = map(x, 0, RES_WIDTH, 0.0, 1.0);
    myMessage.add(scaled);
    oscP5.send(myMessage, myRemoteLocation);

    myMessage = new OscMessage("/"+name+"/OldestMissileY");
    scaled = map(y, 0, RES_HEIGHT, 0.0, 1.0);
    myMessage.add(scaled);
    oscP5.send(myMessage, myRemoteLocation);
  }
}
