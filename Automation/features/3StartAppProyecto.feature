Feature: Crear proyecto de StartApp
  Como un lider de StartAPP
  Quiero crear un proyecto en la plataforma
  Asi testear la creacion de un proyecto correctamente

Scenario: Crear un proyecto completo en StartApp
  Given Este en la pagina de proyectos de StartApp
  And presiono en el boton CREAR PROYECTO
  When registro los datos de la siguiente tabla
	|Titulo: 	        | Salvar Perritos                            |
    |Descripcion: 	    | Ayudar a los perro callejeros de la calle  |
    |Objetivo: 	        | Tener el 50% de los perros en un refugio   |
    |Lider: 	        | Allen                                      |
  And presiono el boton CREAR 
  Then se crea una tarjeta con el proyecto segun los siguientes datos
    |Proyecto: 	        | Salvar Perritos                            |
    |Objetivo: 	        | Tener el 50% de los perros en un refugio   |
    |Descripcion: 	    | Ayudar a los perro callejeros de la calle  |
    |Lider: 	        | Allen                                      |