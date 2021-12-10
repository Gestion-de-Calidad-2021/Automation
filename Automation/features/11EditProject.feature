Feature: Edit a project on Start Americas Together
  As a leader account on Start Americas Together
  I want to edit a project on the platform
  So that I can edit a project where I made a mistake when placing a data or updating an information

@maximize
Scenario Outline: Edit the first project in StartApp
  Given the leader user is logged with the email and password on Start Americas Together homepage
  And I press the Proyectos button
  When I press the button to edit the first project
  And I put in the fields for the first project the new values or data show below
    |Titulo:              | Salvar Perros y gatos                                             |
    |Descripcion:         | Ayudar a los perros y gatos callejeros de la calle de Santa Cruz  |
    |Objetivo:             | Tener el 60% de los perros y gatos en un refugio                  |
    |Lider:               | Lider-C                                                           |
  And click on EDITAR button
  Then the project is edited according to the following data
    |Proyecto:             | Salvar Perros y gatos                                             |
    |Objetivo:             | Tener el 60% de los perros y gatos en un refugio                  |
    |Descripción:         | Ayudar a los perros y gatos callejeros de la calle de Santa Cruz  |
    |Lider:                | Lider-C                                                           |