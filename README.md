# DataWeave Library Extension

The DataWeave extension adds language support that enables you to develop, debug, and test DataWeave scripts.

The DataWeave extension also enables you to quickly start creating DataWeave libraries by:

* Guiding you through project creation and setup
* Easing your development efforts by offering autocompletion, navigation, and reactors features
* Facilitating testing by providing DataWeave Testing Framework (Beta) and debugger

**Requirements**

  * Java 8 or 11 provided
  * Apache Maven
  * Microsoft Visual Studio Code for your specific operating system
  * DataWeave 2.0 (BETA) library in VS code (Extensions tab)
  
**Developing DataWeave Libraries**

To reuse the Dataweave modules over and over in same/different projects, Dataweave libraries is a set of or particular functionality in a module, to create your own custom dataweave library.

**Steps to publish the library**

* Clone the repo.
* open the project in vs code.
* change the ORGANIZATION_ID to your anypoint cloudhub org id in pom.xml(3 places), and change groupId with your value.
* Update the username and password of anypoint login in your local system(C:\Users\{your user account}\.m2) settings.xml 
* Run the mvn deploy -s settings.xml
* Validate the dataweave library in anypoint exchange.
* Copy the dependency snippets of dataweave library and use in sample anypoint studio project to test the dataweave module.
* Also try to run, debug and test your module, mapping, unit test and integration test in vs code.  

**References**

https://medium.com/@k.sandeep5121/add-dataweave-library-extension-ublish-dw-library-project-to-exchange-7ae4040a4b40
