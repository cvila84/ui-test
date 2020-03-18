# ui-test

PoC of UI tests with Selenium &amp; RobotFramework

## The context

As it seems complicated to run automatic UI tests with proxy enabled for Chrome and Firefox, there is a need to understand and describe the context that will allow this kind of tests to work

- RobotFramework latest version : 3.1.2
- Selenium latest version : 3.141.59

### Libraries

SeleniumLibrary is a python library
- https://github.com/robotframework/SeleniumLibrary
- The latest version is 4.3.0. Headless are supported since 3.1.0 (and require Selenium 3.8.0)
- The documentation is available at https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

But as we are running RobotFramework in JVM, we cannot use SeleniumLibrary python library, instead we have to use a Java one
- https://github.com/MarketSquare/robotframework-seleniumlibrary-java
- Versions follow Selenium version, so latest version is 3.141.59
- The JAR with dependencies can be found here : https://repo1.maven.org/maven2/com/github/hi-fi/robotframework-seleniumlibrary/3.141.59.26535/robotframework-seleniumlibrary-3.141.59.26535-jar-with-dependencies.jar
- The documentation is available at https://repo1.maven.org/maven2/com/github/hi-fi/robotframework-seleniumlibrary/3.141.59.26535/robotframework-seleniumlibrary-3.141.59.26535.html
- As stated, “Some keyword differences between this and Python version exists. (Same) keywords should be aligned in upcoming versions.”

## The project

- The native module calls Selenium classes to run automated tests (with proxy enabled). These are the reference tests.
- The robotframework module contains RF tests calling keywords implemented by robotframework-seleniumlibrary-java. If these tests run in the same way as native module, we have fixed our issues !
