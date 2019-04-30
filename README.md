# Smash

This project is the draft of a dart game.
It is differentiated by its construction: The target is built around a Wimos, which recovers the value of the force of the thrown.
A computer retrieves its information and translates this value into a point.
The goal is to get more point than his opponent.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
See deployment for notes on how to deploy the project on a live system.

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

A step by step series of examples that tell you how to get a development env running

```
apt-get install ...
```

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://github.com/esgi-mmk/smash) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Steven K-JOHNSON** - [GitHub](https://github.com/esgi-mmk/smash)
* **William MORGADO** - [GitHub](https://github.com/esgi-mmk/smash)
* **Louis MANTOPOULOS**  - [GitHub](https://github.com/esgi-mmk/smash)


See also the list of [contributors](https://github.com/esgi-mmk/smash/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
