
Feature: Start Americas Participate in proyects
   As a volunteer of start americas 
   I want to participate in the proyects 
   so I can help to other people and make an impact to the society

@maximize
Scenario Outline: Participate in Test Event Lider
	Given I am on the main homepage of Start Americas Together Website
	When I press the sections of "Eventos"
    And I press the button of "Participar" in the Test Event Lider
    Then I should be participating in Test Event Lider with the option of "Eliminar Participacion"