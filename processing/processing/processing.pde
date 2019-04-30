/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;

void setup() {
  size(400,400);
  frameRate(250);
  /* start oscP5, listening for incoming messages at port 4559 */
  oscP5 = new OscP5(this,4559);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the content of the received OscMessage */
  //print("Val 1 received" + theOscMessage.get(0).floatValue());
  //print("Val 1 received" + theOscMessage.get(1).floatValue());
  //println("Val 1 received" + theOscMessage.get(2).floatValue());
  print(theOscMessage.addrPattern());
  println(theOscMessage.arguments().length);
}
