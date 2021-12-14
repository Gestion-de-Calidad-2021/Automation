Feature: Delete event
  As administrator user of Start Americas Together
  I want to delete an event
  so that I can delete the event of Eventos section
  
Scenario Outline:Delete an event      
Given the "<user>" is logged with the email and password on Start Americas Together homepage
When the "<user>" click on Eventos option.
And click on Eliminar button of Evento Académico 2021
Then the platform show an alert box
And the "<user>" click on Aceptar 
And the "<user>" return to the Eventos option
And the event doesn't exist in the Eventos option

Examples: 
| user            |
| lider user      |
| coreteam user   |