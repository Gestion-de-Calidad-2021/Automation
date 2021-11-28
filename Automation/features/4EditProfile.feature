Feature: As voluntario user
         I want to edit my profile
         so that I can update the information of my profile


Scenario: Edit the name of the profile        
  Given the voluntario user is logged with the email and password on Start Americas Together homepage
  When the voluntario user click on "Perfil" option
  And click on EDITAR PERFIL
  And the voluntario user will update his name to Juan
  And click on GUARDAR
  Then the voluntario user can see his name updated on the Perfil information with "Juan"



