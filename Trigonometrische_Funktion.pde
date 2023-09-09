
ArrayList<PVector> sinewave = new ArrayList<PVector>();

float angle = 0;
float x = 0;
float y = 0;
float xOffset = 300;

final float MIDPOINTCIRCLE = 200;

final float XMOVEMENT = 1.5;
final int AMPLITUDE = 170;


void setup() {
  size(1300, 900);
  background(55);
  stroke(255);
}


void draw() {
  background(55);
  angle += 0.02;

  //Calculating x and y
  x = MIDPOINTCIRCLE + xOffset; //!______________________________!
  y = sin(angle) * AMPLITUDE + height/2;
  sinewave.add(new PVector(x, y));


  // Circle, Lines and Triangle
  ellipse(MIDPOINTCIRCLE, height/2, AMPLITUDE * 2, AMPLITUDE * 2);

  //Triangle
  line(MIDPOINTCIRCLE, height/2, MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2 + sin(angle) * AMPLITUDE);
  line(MIDPOINTCIRCLE, height/2, MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2);

  //Bluefill
  fill(0, 0, 255);
  beginShape();
  vertex(MIDPOINTCIRCLE, height/2);
  vertex(MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2 + sin(angle) * AMPLITUDE);
  vertex(MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2);
  endShape();

  //Redline
  stroke(255, 0, 0);
  line(MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2 + sin(angle) * AMPLITUDE, MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2);
  
  //Connection to wave (green line)
  stroke(0, 255, 0);
  line(MIDPOINTCIRCLE + cos(angle) * AMPLITUDE, height/2 + sin(angle) * AMPLITUDE, MIDPOINTCIRCLE + xOffset, height/2 + sin(angle) * AMPLITUDE);
  stroke(255);
  
  //Axis
  line(0, height/2, width, height/2);
  line(MIDPOINTCIRCLE, 0, MIDPOINTCIRCLE, height);


  //Drawing of the Sinewave
  noFill();
  beginShape();
  for (int i = sinewave.size() - 1; i > 0; i--) {
    sinewave.get(i).x += XMOVEMENT;
    if (sinewave.get(i).x > width) {
      sinewave.remove(i);
    }
    //point(sinewave.get(i).x * 5, sinewave.get(i).y);
    //print(sinewave.get(i) + "\n\n");
    vertex(sinewave.get(i).x, sinewave.get(i).y);

    print(cos(angle) * AMPLITUDE + "\n\n");
  }
  endShape();
}
