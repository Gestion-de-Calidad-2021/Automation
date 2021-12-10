
Feature: Start Americas main Page
   As a regular user
   I want to login in the Website
   so I can participate and see the events and proyects of Start Americas Together

Scenario Outline: Login to the page 
    Given I am on the main homepage of StartAmericas website
    When I press the login button ubicate at the right corner
    And I enter as "<user>"
    And I enter the password
    And I click the "Iniciar Sesion" button
	Then I should enter at the main page and see the proyects and events

Examples:
|user|    
|voluntario|
|lider     | 

