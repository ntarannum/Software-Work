<link rel='stylesheet' href='web/swiss.css'/>

# Gradle exercise 2

Follow the steps used in Gradle exercise 1 to import the project into the STS IDE workspace.

## Getting started

<div class="all-questions">

The project has the following structure

	|-- build.gradle
	|-- src
		|-- main
			|-- java
				|-- labGradle
					|-- Log4jExample.java : main class that uses log4j
			|-- resources
				|-- log4j.properties : configuration of log4j
	|-- log4j
		|-- log.out : file that will be generated once you run the application
	
The build script uses the following plugins:
* [java](https://docs.gradle.org/current/userguide/java_plugin.html): to build Java projects, as explained [in this Pluralsight video](https://app.pluralsight.com/player?course=gradle-fundamentals&author=kevin-jones&name=gradle-fundamentals-m5&clip=0&mode=live);
* [application](https://docs.gradle.org/current/userguide/application_plugin.html): to run Java console applications, as explained [in this Pluralsight video](https://app.pluralsight.com/player?course=gradle-fundamentals&author=kevin-jones&name=gradle-fundamentals-m5&clip=5&mode=live); and
* [eclipse](https://docs.gradle.org/current/userguide/eclipse_plugin.html): to configure the eclipse workpace using `./gradlew -q eclipse`.

## Exercise (:star:)

Configure the gradle build script required to run a small program in Java that uses [log4j 1.2.17](https://logging.apache.org/log4j/1.2/manual.html), [available from Maven Central](http://mvnrepository.com/artifact/log4j/log4j/1.2.17), by adding the corresponding dependency.

Once you have added the corresponding dependency in `build.gradle`, execute the program with `./gradlew run` and check that the log file `log4j/log.out` contains the following lines (you may need to refresh the project folder in STS in order to see the generated file):

		Hello this is a debug message
		Hello this is an info message 

* *Hint*: if the file gradlew is not present, execute `gradle wrapper`
* *Hint*: use the following sequence of commands in order to use imported libraries in Java projects in the STS.
  - `./gradlew cleanEclipse clean eclipse` in MacOS/Linux, and `gradlew.bat cleanEclipse clean eclipse` in MS Windows.
  - Refresh the project in the STS by using F5 (or right-click on resource > refresh)
		
## Additional Resources

* [Getting started](https://docs.gradle.org/current/userguide/tutorials.html): official Gradle tutorial to get started with Gradle.
* [Gradle's user guide](https://docs.gradle.org/current/userguide/userguide)

## Credits

* Some parts of this tutorial have been adapted from [this tutorialspoint's tutorial on log4j](http://www.tutorialspoint.com/log4j/log4j_sample_program.htm).

***
&copy; Artur Boronat, 2015 

