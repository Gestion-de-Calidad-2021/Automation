
Feature: Start Americas main Page
   As a client user
   I want to create a user in the page
   so I can access to the page with  my user

@maximize
Scenario Outline: Register on Start Americas page
	Given I am on the main page
	When I press the login button
    And I press the crear cuenta nueva button
	And I enter the required fields as show below
	|Correo electronico: 	    | prueba@email.com           |
    |Nombre: 	    | Pepito              |
    |Apellido: 	    | Perez              |
    |Numero de telefono: 	     | 77777777      |
    |Contraseña:          | Prueba123           | 
    |Confirma tu Contraseña:  | Prueba123           |
	And press Crear Cuenta start
    Then the user will be created
