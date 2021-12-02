
Feature: Start Americas Archive the EVENTS
   As a  user of Start Americas Together 
   I want to archive the past events 
   so I can order the events.

@maximize
Scenario Outline: Archive the 4 EVENT
	Given I am on the main homepage of Start Americas Together Website.
	When I press the sections of "Eventos".
    And I press the button of "Archivar" of the fourth event
    Then I shouldnt see the event in the events main page, but can see it in "Eventos Pasados"