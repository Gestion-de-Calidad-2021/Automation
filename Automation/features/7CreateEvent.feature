Feature: Create event
  As regular user of Start Americas Together
  I want to create an event
  so that I can create an event in Start Americas Together

@onlyThis
Scenario Outline: Create an event
Given the "<user>" is logged with the email and password on Start Americas Together homepage
When the "<user>" click on Eventos option
And the "<user>" click on Crear Evento Button
And the "<user>" enter required fields to create event as shown below
  |name of the event:                | Evento Académico 2021 |
  |description:                      | Evento Académico para los estudiantes de pregrado de la carrera de ingenirería de sistemas |
  |mode:                             | Virtual              |
  |site:                             | https://us02web.zoom.us/j/8982343162669?pwd=Q1V5c0VQODczeU1RSBVASDASDFASDGHSDF01          |
  |date:                             | 15/02/2022           |
And the "<user>" click on Registrar Evento
Then the platform show an alert box in Eventos
And the "<user>" click on Aceptar Button
And the "<user>" can see the event "Evento Académico 2021", "Evento Académico para los estudiantes de pregrado de la carrera de ingenirería de sistemas", "Virtual", "https://us02web.zoom.us/j/8982343162669?pwd=Q1V5c0VQODczeU1RSBVASDASDFASDGHSDF01", "15/02/2022" created on "Eventos" option

Examples: 
| user            |
| voluntario user |
| lider user      |