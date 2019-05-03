# Smash

This project is the draft of a dart game.
It is differentiated by its construction: The target is built around a Wemos, which recovers the value of the force of the thrown.
A computer retrieves this information and translates the value into a point.
The goal is to get more point than our opponent.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
### Prerequisites

##### Arduino

0) If you don't have Arduino, download it: 
[arduino.cc/en/main/software](https://www.arduino.cc/en/main/software)

1) If you don't use Linux, you need drivers: 
[wiki.wemos.cc/downloads](https://wiki.wemos.cc/downloads)

2) If you never used ESP8266 with your Arduino IDE you need to follow this procedure:
[github.com/esp8266/Arduino#installing-with-boards-manager](https://github.com/esp8266/Arduino#installing-with-boards-manager)

3) If you never used the MPU-6050 or OSC in Arduino, use the following keywords in the Library Manager:

 - MPU6050

 - Open Sound Control (osc) by Adrian Freed and Yotam Mann

It will allow you to install these libraries, here is the procedure: 
[arduino.cc/en/Guide/Libraries#toc3](https://www.arduino.cc/en/Guide/Libraries#toc3)


#### PROCESSING

0) If you don't have it, download Processing: [processing.org/download](https://processing.org/download)

1) As in the Arduino section, install the following libraries with the Library Manager:

 - oscP5 by Andreas Schlegel

 - controlP5 by Andreas Schlegel

Procedure:
[github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library](https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library)


### Installing

Clone our repository. 
In order to make this project run, you need to be on the same wifi network. 
Launch package "smash_sensor" in Arduino software, and package "App" in processing. 
Make sure the listening port chosen isn't taken.

## Contributing

Please read [CONTRIBUTING.md](https://github.com/esgi-mmk/smash) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Steven K-JOHNSON** - [GitHub](https://github.com/esgi-mmk/smash)
* **William MORGADO** - [GitHub](https://github.com/esgi-mmk/smash)
* **Louis MANTOPOULOS**  - [GitHub](https://github.com/esgi-mmk/smash)


See also the list of [contributors](https://github.com/esgi-mmk/smash/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### Creation of the project 

![alt text](https://zupimages.net/up/19/18/5h2j.jpg)
![alt text](https://zupimages.net/up/19/18/rm0b.jpg)
![alt text](https://zupimages.net/up/19/18/w476.jpg)
![alt text](https://zupimages.net/up/19/18/ygx3.png)


