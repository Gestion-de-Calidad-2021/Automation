Feature: As voluntario user
         I want to see my profile
         so that I can see all the information of my profile


Scenario: Profile exists        
  Given the voluntario user is logged on Start Americas Together homepage
  When the voluntario user click in "Perfil" 
  Then the voluntario will see his personal information, events and projects



