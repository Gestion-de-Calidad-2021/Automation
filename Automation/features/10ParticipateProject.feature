Feature: Participate a project on Start Americas Together
   As a volunteer account on Start Americas Together
   I want to participate in the proyects 
   So that I can help to other people, contribute to the constant improvement of society and have new experiences

@maximize
Scenario Outline: Participate in the first project
    Given I am logged as a volunteer with the email and password on Start Americas Together homepage
    And I press the "Proyectos" section of the main page
    When I press the "Participar" button a project
    Then it should show me a confirmation message with the following message "Se registro la participacion con exito" and an OK button