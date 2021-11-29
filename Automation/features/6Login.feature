
Feature: Start Americas main Page
   As voluntario user
   I want to login in the Website
   so I can access to the page with  voluntario privileges

Scenario Outline: Login to the page with voluntario privileges        
    Given I am on the main homepage
    When I press the login button
    And I enter required fields as shown below
	    |Correo electronico: | voluntario@gmail.com |
        |Contraseña: 	     | 123456              |
    And I click the "Iniciar Sesion" button
	Then I should enter at the main page with the voluntario privileges

