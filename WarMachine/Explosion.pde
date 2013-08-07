/*
Explosions are based off of circles that can expand in radius over time
Also starting to get additional draw modes, like rectangles that sample colors as well as letterforms
*/
class Explosion {

  private float x, y, radius, maxRadius;
  private int growthRate = 2; //determines how fast the explosions grow&burst

  private color explosionColor = color(0);
  private int explosionDrawMode;

  //modes
  public static final int RECTANGLES = 0;
  public static final int CIRCLES = 1;
  public static final int LETTERS = 2;
  public static final int GROWINGLETTERS = 3;
  
  Explosion(float x, float y, int maxRadius) {
    this.x = x;
    this.y = y;
    this.maxRadius = maxRadius;
    radius = 0;
  }

  public void update(float delta) {
    if (delta % growthRate == 0) { //frame based for the moment.. move to time eventually
      if (radius <= maxRadius) {
        radius++;
      }
    }
  }

  public void draw(int drawMode) {

    switch(drawMode) {

    case CIRCLES:
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse(x, y, radius, radius);
      break;

    case RECTANGLES: 
      stroke(random(255));
      strokeWeight(random(3));
      fill(explosionColor);
      rect(x, y, random(.2, 1.)* radius, random(.2, 1.)* radius);
      break;

   /* add some letterform based modes...  
   String word ="somePhrase...";
   char[] letters = word.toCharArray();
   case LETTERS: 
       textAlign(CENTER);
       textFont(warFont, 45);
       fill(random(255));
       int charIndex = int(map(x, 0, RES_WIDTH, 0, letters.length -1));
       text(letters[charIndex], x, y);
       break;
       
       case GROWINGLETTERS: 
       textAlign(CENTER);
       textFont(warFont, 1*radius);
       fill(random(255), random(255), random(255));
       text("YourAdHere", x, y);
       break;
       */
    }
  }

  public boolean isFinishedExploding() {
    return (radius >= maxRadius);
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  public float getRadius() {
    return radius;
  }


  public void setColor(color explosionColor) {
    this.explosionColor = explosionColor;
  }
}

