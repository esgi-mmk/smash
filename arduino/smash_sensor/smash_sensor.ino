#include <MPU6050_tockn.h>
#include <Wire.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <OSCMessage.h>

#include "Wire.h"
#include "string.h"
#include <MPU6050_tockn.h>

////////////////////////////////////////////////////////////////////////////////
char ssid[] = "William";                // TODO: your network SSID (name)
char pass[] = "toto1shsh";             // TODO: your network password
const IPAddress outIp(172,20,10,2); // TODO: remote IP of your computer
////////////////////////////////////////////////////////////////////////////////

const float MIN_VALUE_FOR_2G = 8.00;
const float MIN_VALUE_FOR_4G = 4.50;
const float MIN_VALUE_FOR_8G = 3.50;

const int VALUE_RESCALE_RATE = 4;
const unsigned int localPort = 8888;  // local port to listen for OSC packets (not used for sending)
const unsigned int outPort = 4559;    // remote port to receive OSC
TwoWire i2c;

WiFiUDP Udp;                          // A UDP instance to let us send and receive packets over UDP


MPU6050 mpu6050(i2c);

long timeStamp = 0;
bool flag = false;


void setup() {
    Serial.begin(115200);
    i2c.begin(D3, D4);
    
    mpu6050.begin();
    //mpu6050.writeMPU6050(MPU6050_ACCEL_CONFIG, 0x18); // 16g
    mpu6050.writeMPU6050(MPU6050_ACCEL_CONFIG, 0x10); // 8g
    //mpu6050.writeMPU6050(MPU6050_ACCEL_CONFIG, 0x08); // 4g


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

    pinMode(D5, INPUT_PULLUP);
    pinMode(D6, INPUT_PULLUP);
    pinMode(D7, INPUT_PULLUP);
    
    pinMode(LED_BUILTIN, OUTPUT);


}

void loop() {
    // loop every 10 ms;
    // 10ms => 100Hz
    if(millis() - timeStamp > 10){
      mpu6050.update();
      timeStamp = millis();
      
      int areaTouched = getAreaTouched();
      
      if(areaTouched >= 0){
        OSCMessage msg("/test");
        float maxValue = 0.00;

        //set a timer to count 1000 ms
        long timer = millis();
        while(!flag){
          
          float value = checkPressure();
          if(maxValue <= value){
            maxValue = value; 
          }
        //if time spent is more than 1 sec than we stop checking values
          if(millis() - timer > 1000){
            flag = !flag;
          }
        }
        flag = !flag;
        Udp.beginPacket(outIp, outPort);
        msg.add(areaTouched);
        msg.add(maxValue);
        msg.send(Udp);

        Serial.print("Message sended : (maxValue : ");
        Serial.print(maxValue);
        Serial.print(", areaTouched : ");
        Serial.print(areaTouched);
        Serial.println(")");
        
        Udp.endPacket(); 
        msg.empty();

      } else {
        //Serial.println("Waiting for button press")
      }

    }
}

int getAreaTouched(){
  
  boolean btnPressed1 = !digitalRead(D5);
  boolean btnPressed2 = !digitalRead(D6);
  boolean btnPressed3 = !digitalRead(D7);
  
  if (btnPressed1 == true) {
    digitalWrite(LED_BUILTIN, LOW);
    return 0;
  } else {
    digitalWrite(LED_BUILTIN, HIGH);
  }

  if (btnPressed2 == true) {
    digitalWrite(LED_BUILTIN, LOW);
    return 1;
  } else {
    digitalWrite(LED_BUILTIN, HIGH);
  }
  
  if (btnPressed3 == true) {
    digitalWrite(LED_BUILTIN, LOW);
    return 2;
  } else {
    digitalWrite(LED_BUILTIN, HIGH);
  }

  return -1;
}

float checkPressure(){
  float axes[3] = {fabs(mpu6050.getAccX()) * VALUE_RESCALE_RATE, fabs(mpu6050.getAccY()) * VALUE_RESCALE_RATE, fabs(mpu6050.getAccZ()) * VALUE_RESCALE_RATE};
  
  int size_axes = sizeof(axes) / sizeof(axes[0]);
  int i = 0;
  float maxValue = 0.0;
  
  while (i < size_axes){
    if(maxValue < axes[i]) {
      maxValue = axes[i];
    }
    
    i++;
  }
  
  mpu6050.update();
  return maxValue;
}
