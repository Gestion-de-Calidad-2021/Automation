Feature: Create a project on Start Americas Together
  As a leader account on Start Americas Together
  I want to create a project on the platform
  So that I can create a new project for the company and volunteers

@maximize
Scenario Outline: Create a complete new project in StartApp
  Given the leader user is logged with the email and password on Start Americas Together homepage
  And I press the Proyectos button
  When I press the button to create a new proyect "CREAR PROYECTO"
  And I enter the required fields for a new project as show below
	  |Titulo:  	        | Salvar Perritos                             |
    |Descripcion: 	    | Ayudar a los perros callejeros de la calle  |
    |Objetivo: 	        | Tener el 50% de los perros en un refugio    |
    |Lider:   	        | Lider-A                                     |
  And click on CREAR button
  Then a card is created with the project according to the following data
    |Proyecto: 	        | Salvar Perritos                            |
    |Objetivo: 	        | Tener el 50% de los perros en un refugio   |
    |Descripcion: 	    | Ayudar a los perros callejeros de la calle |
    |Lider: 	          | Lider-A                                    |