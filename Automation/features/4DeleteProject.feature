Feature: Delete a project on Start Americas Together
  As a leader account on Start Americas Together
  I want to delete a project on the platform
  So that I can delete a new project that I created by mistake and I don't want to give untrue information to the volunteers.

@maximize
Scenario Outline: Delete a project in StartApp
  Given the leader user is logged with the email and password on Start Americas Together homepage
  And I press the Proyectos button
  When I press the button to delete a project "DELETE"
  Then the number of project cards decreases by one

@maximize
Scenario Outline: Delete a project with a confirmation message
  Given the leader user is logged with the email and password on Start Americas Together homepage
  And I press the Proyectos button
  When I press the button to delete a project "DELETE"
  Then it should show me a confirmation message with the message "Estas seguro de eliminar el siguiente proyecto" and two buttons to confirm and cancel the action.
  And I press the button to confirm the action