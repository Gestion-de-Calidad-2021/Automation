Feature: As voluntario user
         I want to delete my profile
         so that I can delete all the information of my profile


Scenario: Delete profile        
  Given the voluntario user is logged with the email and password on Start Americas Together homepage
  When the voluntario user click on "Perfil" option
  And click on ELIMINAR PERFIL
  Then the voluntario user can see his Perfil information deleted


