Feature: As a internet user
         I want to use the google search engine
         so I test that works correctly


Scenario: Search for the Houston Dynamo Website        
  Given I am on the Google homepage
  When I search for "Houston Dynamo Tickets"
  Then I will click the "Tickets - Houston Dynamo FC" link

@cc
Scenario: Searching for a UCB Site
  Given I am on the Google homepage
  When I search for "UCB Cochabamba"
  Then I see that the UCB is located at "M.M.Marques, Cochabamba" street


