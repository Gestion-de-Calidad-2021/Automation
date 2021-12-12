
Feature: Start Americas Register Page
   As a regular user
   I want to create a user in the Start Americas page
   so I can participate and see the events and proyects

@maximize
Scenario Outline: Register on Start Americas page
	Given I am on the main homepage of Start Amercias Together Website      
	When I press the login  button ubicated at the right corner
    And I press the crear cuenta nueva button
	And I enter the required fields as show below to
	|Correo electronico: 	    | prueba@email.com    |
    |Nombre: 	                | Pepito              |
    |Apellido:          	    | Perez               |
    |Numero de telefono:        | 77777777            |
    |Contraseña:                | Prueba123           | 
    |Confirma tu Contraseña:    | Prueba123           |
	When I press Crear Cuenta start
    Then the user will be created and can login with the next credentials
    |Correo electronico: 	    | prueba@email.com    |
    |Contraseña:                | Prueba123           | 


@maximize
Scenario Outline: Dont let Register on Start Americas page with incorrect phone format
	Given I am on the main homepage of Start Amercias Together Website   
	When I press the login  button ubicated at the right corner
    And I press the crear cuenta nueva button
	And I enter the required fields as show below to
	|Correo electronico: 	    | prueba@email.com    |
    |Nombre: 	                | Pepito              |
    |Apellido:          	    | Perez               |
    |Numero de telefono:        | asfq23            |
    |Contraseña:                | Prueba123           | 
    |Confirma tu Contraseña:    | Prueba123           |
	
    Then phone camp should show me a waring of incorrect phone format


