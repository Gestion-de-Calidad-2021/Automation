Feature: As "<typeOfUser>" user
         I want to edit my profile
         so that I can update the information of my profile


Scenario Outline:Edit the name of the profile        
  Given the "<typeOfUser>" user is logged with the email and password on Start Americas Together homepage
  When the "<typeOfUser>" user click on "Perfil" option
  And click on EDITAR PERFIL
  And the "<typeOfUser>" user will update his name to Juan
  And click on GUARDAR
  Then the "<typeOfUser>" user can see his name updated on the Perfil information with "Juan"

Examples: 
|typeOfUser|
|voluntario|
|lider     |
