Feature: Edit profile information
  As regular user of Start Americas Together
  I want to edit my profile
  so that I can update the information of my profile
  
Scenario Outline:Edit the name of the profile        
Given the "<user>" Juan is logged with the email and password on Start Americas Together homepage
When the "<user>" click on "Perfil" option
And click on EDITAR PERFIL
And the "<user>" will update his name to Juan
And click on GUARDAR
Then the "<user>" can see his name updated on the Perfil information with "Juan"

Examples: 
| user            | description                     |
| voluntario user | apasionado en ser voluntario    |
| lider user      | apasionado en organizar eventos |

@onlyThis
Scenario Outline:Edit the name, lastname, birthday date, ocupation, profession, interests, qualities, country of residence, city of residence, phone number, genre, emergency contact name, relationship to emergency contact, emergency contact number and description of the profile        
Given the "<user>" Jose is logged with the email and password on Start Americas Together homepage
When the "<user>" Jose click on "Perfil" option
And the "<user>" Jose click on EDITAR PERFIL
And the "<user>" Jose will update his name to Pedro
And the "<user>" Jose will update his lastname to Lopez
And the "<user>" Jose will update his birthday date to "10/05/1998"
And the "<user>" Jose will update his ocupation to Universidad
And the "<user>" Jose will update his profession to Estudiante
And the "<user>" Jose will update his interests to Educacion
And the "<user>" Jose will update his qualities to Organizacion
And the "<user>" Jose will update his country of residence to Colombia
And the "<user>" Jose will update his city of residence to Bogotá
And the "<user>" Jose will update his phone number to "5482659"
And the "<user>" Jose will update his genre to Masculino
And the "<user>" Jose will update his name of contact emergency to Pepe
And the "<user>" Jose will update his relationship to emergency contact to amigo
And the "<user>" Jose will update his number of emergency contact to "45862915"
And the "<user>" Jose will update his description of the profile to  "<description>"
And the "<user>" Jose click on GUARDAR
Then the platform show an alert box
And the "<user>" Jose click on Aceptar 
And the "<user>" Jose can see his name, lastname, birthday date, ocupation, profession, interests, qualities, country of residence, city of residence, phone number, genre, emergency contact name, relationship to emergency contact, emergency contact number and description updated on the Perfil information with "Pedro", "Lopez", "10/05/1998", "Universidad", "Estudiante", "Educacion", "Organizacion", "Colombia", "Bogotá", "5482659", "Masculino", "Pepe", "amigo", "45862915", "<description>"


Examples: 
| user            | description                     |
| voluntario user | apasionado en ser voluntario    |
| lider user      | apasionado en organizar eventos |
