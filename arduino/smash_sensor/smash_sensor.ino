#include <MPU6050_tockn.h>
#include <Wire.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <OSCMessage.h>

#include "Wire.h"
#include <MPU6050_tockn.h>

////////////////////////////////////////////////////////////////////////////////
char ssid[] = "William";                // TODO: your network SSID (name)
char pass[] = "toto1shsh";             // TODO: your network password
const IPAddress outIp(172,20,10,2); // TODO: remote IP of your computer
////////////////////////////////////////////////////////////////////////////////

const float MIN_VALUE = 1.25;
const unsigned int localPort = 8888;  // local port to listen for OSC packets (not used for sending)
const unsigned int outPort = 4559;    // remote port to receive OSC
TwoWire i2c;

WiFiUDP Udp;                          // A UDP instance to let us send and receive packets over UDP


MPU6050 mpu6050(i2c);

long timeStamp = 0;


void setup() {
    Serial.begin(115200);
    Serial.println("Hello!");

    i2c.begin(D3, D4);
    mpu6050.begin();

    // Connect to WiFi network
    Serial.print("\nConnecting to ");
    Serial.println(ssid);
    WiFi.begin(ssid, pass);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("\nWiFi connected - IP address: ");
    Serial.println(WiFi.localIP());

    Serial.println("Starting UDP");
    Udp.begin(localPort);

    Serial.print("Local port: ");
    Serial.println(Udp.localPort());

}

void loop() {
    // 10ms => 100Hz
    if(millis() - timeStamp > 10){
        mpu6050.update();
        timeStamp = millis();
        OSCMessage msg("/test");    
        
        float maxValue = checkPressure();
        
        if(maxValue >= MIN_VALUE){
          Udp.beginPacket(outIp, outPort);
          msg.add(maxValue);
          msg.send(Udp);

          Serial.print("Message sended : (maxValue : ");
          Serial.print(maxValue);
          Serial.println(")");
          
          Udp.endPacket(); 
          msg.empty();
        }
    }
}


float checkPressure(){
  float axes[3] = {fabs(mpu6050.getAccX()), fabs(mpu6050.getAccY()), fabs(mpu6050.getAccZ())};
  
  int size_axes = sizeof(axes) / sizeof(axes[0]);
  int i = 0;
  float maxValue = 0.0;
  
  while (i < size_axes){
    if(maxValue < axes[i]) {
      maxValue = axes[i];
    }
    
    i++;
  }
  
  return maxValue;
}
