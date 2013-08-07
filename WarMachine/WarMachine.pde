/*
War Machine
by Chris Novello
chrisnovello.com

2013 note:
This is rough code that I wrote a few years back when I was learning to program. 
I figure others might like to tinker with it, just be warned that my design is from when I was starting and is kind of clumsy. 

You'll need the oscP5 library.
http://www.sojamo.de/libraries/oscP5/

I've also released the code because it makes a quick way to change simple things like OSC ports & hosts, as well as the screen resolution.
As a result, I've cut the tiny GUI window that was in previous compiled releases.

Possible todo:
Change update from framerate to time-based
Flesh out drawmodes / use more than just a radius to detect collisions
Do more with the rhizome missiles (make them die with some animation when they go off screen, possibly OSC data when this happens) 
If crazy, abstract draw code away from processing..
*/

static final float HIGH_OSC = 1.0;
static final float LOW_OSC = 0.0;
static final float midOSC = .5;

int RES_WIDTH = 640;
int RES_HEIGHT = 480;

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
int incomingPort = 8804;
int outgoingPort = 8805;

Engine warMachine;

String name = "WarMachine";

void setup() {
  frameRate(30);
  size (RES_WIDTH, RES_HEIGHT);
  smooth(); 

  initialize();
}


void initialize() {
  oscP5 = new OscP5(this, incomingPort);
  myRemoteLocation = new NetAddress("127.0.0.1", outgoingPort);

  warMachine = new Engine();
  //send a msg to indicate the game started/rebooted.
  OscMessage myMessage = new OscMessage("/"+name+"/GameInitialized");
  myMessage.add(1);
  oscP5.send(myMessage, myRemoteLocation);
}

void draw() {
  background(warMachine.getSkyColor());
  warMachine.updateAndDraw(frameCount);
}


//all things OSC:
void oscEvent(OscMessage oscMessage) {

  String[] msgSplit = oscMessage.addrPattern().split("/"); // splits OSC msg

  //If the OSC msg matches the name of the game 
  if (msgSplit[1].equals("WarMachine")) {

    if (msgSplit[2].equals("LaunchExplosion")) {
      float value = oscMessage.get(0).floatValue();
      warMachine.addExplosionAtCrossHair();
    }

    else if (msgSplit[2].equals("SetCrosshairX")) {
      float value = oscMessage.get(0).floatValue();
      warMachine.setCrossHairX(map(value, 0.0, 1.0, 0.0, RES_WIDTH));
    }

    else if (msgSplit[2].equals("SetCrosshairY")) {
      float value = oscMessage.get(0).floatValue();
      warMachine.setCrossHairY(map(value, 0.0, 1.0, 0.0, RES_HEIGHT));
    }

    else if (msgSplit[2].equals("AddMissile")) {
      float value = oscMessage.get(0).floatValue();
      if (value == 1.0) {
        warMachine.addMissile();
      }
    }

    else if (msgSplit[2].equals("SetColorOfAllMissiles")) {
      warMachine.setColorOfAllMissiles(color(oscMessage.get(2).intValue()));
    }

    else if (msgSplit[2].equals("SetExplosionRadius")) {
      float value = oscMessage.get(0).floatValue();
      warMachine.setMaxExplosionSize(int(map(value, 0.0, 1.0, 1, 50)));
    }

    else if (msgSplit[2].equals("KillAllMissiles")) {
      float value = oscMessage.get(0).floatValue();
      warMachine.killAllMissiles();
    }

    else if (msgSplit[2].equals("ChangeDrawMode")) {
      float value = oscMessage.get(0).floatValue();
      if (value == 1.0) {
        warMachine.nextDrawMode();
      }
    }

    //testing a new type of data
    else if (msgSplit[2].equals("ExplodeAtCoordinateWithColor")) {
      float x = map(oscMessage.get(0).floatValue(), LOW_OSC, HIGH_OSC, 0, width);      
      float y = map(oscMessage.get(1).floatValue(), LOW_OSC, HIGH_OSC, 0, height);

      color withColor = color(oscMessage.get(2).intValue());

      warMachine.addExplosionAtCoordinate(x, y, withColor);
      warMachine.setCrossHairX(x);
      warMachine.setCrossHairY(y);
    }
  }
}
