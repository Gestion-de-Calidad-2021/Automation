Feature: Delete profile information
  As regular user of Start Americas Together
  I want to delete my profile
  so that I can delete the information of my profile
  
Scenario Outline:Delete the profile        
Given the "<user>" is logged with the email and password on Start Americas Together homepage
When the "<user>" click on "Perfil" option.
And click on ELIMINAR PERFIL
Then the platform show an alert box
And the "<user>" click on Aceptar 
And the "<user>" return to the home page 
And the "<user>" doesn't have access to the Start Americas Together

Examples: 
| user            |
| voluntario user |
| lider user      |
