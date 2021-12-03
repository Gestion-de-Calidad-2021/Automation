Feature: Participate a project on Start Americas Together
   As a volunteer account on Start Americas Together
   I want to participate in the proyects 
   So that I can help to other people, contribute to the constant improvement of society and have new experiences

@maximize
Scenario Outline: Participate in the first project
	Given I am logged as a volunteer with the email and password on Start Americas Together homepage
	When I press the sections of "Proyectos"
    And I press the button of "Participar"
    Then I should be participating in Test Event Lider with the option of "Eliminar Participacion"