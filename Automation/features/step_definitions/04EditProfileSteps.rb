#You can implement step definitions for undefined steps with these snippets:



Given(/^the "([^"]*)" Juan is logged with the email and password on Start Americas Together homepage$/) do |typeOfUser|
    visit 'https://testing-start.web.app/'
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click

    puts "JUAN USER: "+ typeOfUser
    if(typeOfUser== "voluntario user")
        fill_in 'email', :with => ENV['VOLUNTARIO_USER']
    elsif(typeOfUser== "lider user")
        fill_in 'email', :with => ENV['LIDER_USER']
    end
    fill_in 'password', :with => ENV['PSW']
    buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep 15
  end
  
  When(/^the "([^"]*)" click on "([^"]*)" option$/) do |typeOfUser, perfilButton|
    buttonPerfil_xpath='//*[@id="root"]/header/div[2]/div/button[4]'
    find(:xpath, buttonPerfil_xpath).click
  end
  
  When(/^click on EDITAR PERFIL$/) do
    buttonEditarPerfil_xpath='//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[2]/button[1]'
    find(:xpath, buttonEditarPerfil_xpath).click
  end
  
  When(/^the "([^"]*)" will update his name to Juan$/) do |typeOfUser|
    fill_in "nombre", with: ""
    fill_in 'nombre', :with => 'Juan'
  end

  When(/^click on GUARDAR$/) do
    buttonGuardar_xpath='/html/body/div[2]/div[3]/div[2]/button[1]'
    find(:xpath, buttonGuardar_xpath).click
  end
  
  Then(/^the "([^"]*)" can see his name updated on the Perfil information with "([^"]*)"$/) do |typeOfUser,name|
    userName = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[1]').text
    userNameArray = userName.split
    textName = "Nombre: "+name+" "+userNameArray.last
    if (userName != textName)
        raise "Validation for user name: Failed"    
        puts "Expected: "+textName
        puts "Actual:"+userName
    end
  end


#You can implement step definitions for undefined steps with these snippets:

Given(/^the "([^"]*)" Jose is logged with the email and password on Start Americas Together homepage$/) do |typeOfUser|
  visit 'https://testing-start.web.app/'
  buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
  find(:xpath, buttonLogin_xpath).click
  if(typeOfUser== "voluntario user")
      fill_in 'email', :with => ENV['VOLUNTARIO_USER']
  elsif(typeOfUser== "lider user")
      fill_in 'email', :with => ENV['LIDER_USER']
  end
  fill_in 'password', :with => ENV['PSW']
  buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
  find(:xpath, buttonIniciarSesion_xpath).click
  sleep 5
end

When(/^the "([^"]*)" Jose click on "([^"]*)" option$/) do |typeOfUser, perfilButton|
  buttonPerfil_xpath='//*[@id="root"]/header/div[2]/div/button[4]'
  find(:xpath, buttonPerfil_xpath).click
end

When(/^the "([^"]*)" Jose click on EDITAR PERFIL$/) do |typeOfUser|
  buttonEditarPerfil_xpath='//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[2]/button[1]/span[1]'
  find(:xpath, buttonEditarPerfil_xpath).click
end

When(/^I enter required fields as shown below for Jose user$/) do |table|
  fill_in "nombre", with: ""
  data = table.rows_hash
  fill_in 'nombre', :with => data["name:"]
  fill_in 'Apellido', :with => data["lastname:"]
  fill_in "fecha_de_nacimiento", with: data["birthday:"]
  select data["ocupation:"], :from => "ocupacion"
  fill_in 'Profecion u Oficio', :with => data["profession:"]
  all('input[type=checkbox]').each do |checkbox|
    if checkbox.checked? then 
     checkbox.click
    end
  end
  find(:css, "#educacionCheck[value='Educacion']").set(true) #check true , uncheck false
  find(:css, "#organizacion-check[value='Organizacion']").set(true) #check true , uncheck false
  fill_in 'Pais de recidencia', :with => data["country of residence:"]
  fill_in 'Ciudad de recidencia', :with =>  data["city of residence:"]
  fill_in 'telefono', :with => data["phone number:"]
  select data["genre:"], :from => "genero"
  fill_in 'Nombre de contacto de emergencia', :with => data["name of contact emergency:"] 
  fill_in 'Relación de contacto de emergencia', :with => data["relationship to emergency contact:"]
  fill_in 'Número de contacto de emergencia', :with => data["number of emergency contact:"]
  fill_in 'descripcion_personal', :with => data["description:"]
end

When(/^the "([^"]*)" Jose click on GUARDAR$/) do |user|
  buttonGuardar_xpath='/html/body/div[2]/div[3]/div[2]/button[1]'
  find(:xpath, buttonGuardar_xpath).click
end

Then(/^the platform show an alert box$/) do
  sleep 3
  text = page.driver.browser.switch_to.alert.text
  puts text
  expect(text).to eq 'actualizado correctamente'
end

When(/^the "([^"]*)" Jose click on Aceptar$/) do |user|
  sleep 3
  page.driver.browser.switch_to.alert.accept
end

When(/^the "([^"]*)" Jose can see his name, lastname, birthday date, ocupation, profession, interests, qualities, country of residence, city of residence, phone number, genre, emergency contact name, relationship to emergency contact, emergency contact number and description updated on the Perfil information with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |user, name, lastname, birthdayDate, ocupation, profession, interests, qualities, countryOfResidence, cityOfResidence, phoneNumber, genre, emergencyContactName, relationshipToEmergencyContact, emergencyContactNumber, description|        
  userName = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[1]').text
  textName = "Nombre: "+name+" "+lastname
  
  puts "NAME Actual: "+userName
  puts "NAME Expected: "+textName

  age = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[2]').text
  date = birthdayDate.split('/')
  ageOfUser= Date.today.year-date.last.to_i
  ageCalculate = "Edad: "+ageOfUser.to_s+" años"

  puts "EDAD Actual: "+age
  puts "EDAD Expected: "+ageCalculate

  ocupacionXPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[4]').text
  puts "OCUPACION Actual: "+ocupacionXPATH

  textOcupation = "Ocupación: "+ocupation
  puts "OCUPACION Expected: "+textOcupation

  carrerXPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[5]').text
  puts "CARRERA Actual: "+carrerXPATH

  textProfession = "Carrera: "+profession
  puts "CARRERA Expected: "+textProfession

  phoneXPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[6]').text
  puts "TELEFONO Actual: "+phoneXPATH

  textPhoneNumber = "Telefono: "+phoneNumber
  puts "TELEFONO Expected: "+textPhoneNumber

  cityOfResidenceXPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[7]').text
  puts "CIUDAD DE RESIDENCIA Actual: "+cityOfResidenceXPATH

  textCityOfResidence = "Ciudad de residencia: "+cityOfResidence
  puts "CIUDAD DE RESIDENCIA Expected: "+textCityOfResidence
  
  countryOfResidenceXPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[8]').text
  puts "PAIS DE RESIDENCIA Actual: "+countryOfResidenceXPATH

  textCountryOfResidence = "Pais de residencia: "+countryOfResidence
  puts "PAIS DE RESIDENCIA Expected: "+textCountryOfResidence

  emergencyContactNamePATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[3]/div/p[2]').text
  puts emergencyContactNamePATH

  textEmergencyContactName = "Nombre: "+emergencyContactName
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textEmergencyContactName

  relationshipToEmergencyContactPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[3]/div/p[3]').text
  puts relationshipToEmergencyContactPATH

  textRelationshipToEmergencyContact = "Relacion: "+relationshipToEmergencyContact
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textRelationshipToEmergencyContact

  emergencyContactNumberPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[3]/div/p[4]').text
  puts emergencyContactNumberPATH

  textEmergencyContactNumber = "Teléfono: "+emergencyContactNumber
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textEmergencyContactNumber

  interestsPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[4]/div/p[2]').text
  puts interestsPATH

  textInterests = interests
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textInterests

  qualitiesPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[5]/div/p[2]').text
  puts qualitiesPATH

  textQualities = qualities
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textQualities

  descriptionPATH = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[1]/div[2]/div').text
  puts descriptionPATH

  descriptionArray = descriptionPATH.split(/\n/)
  descriptionXPATH =descriptionArray.last
  puts descriptionXPATH

  textdescription = description
  puts "NOMBRE CONTACTO DE EMERGENCIA  Expected: "+textdescription

  sleep 2
  if (userName != textName) 
      raise "Validation for user name: Failed"    
      puts "Expected: "
      puts "NAME Expected: "+textName

      puts "Actual:"
      puts "NAME Actual: "+userName
  end
  if (age != ageCalculate) 
      raise "Validation for user age: Failed"    
      puts "Expected: "
      puts "EDAD Expected: "+ageCalculate

      puts "Actual:"
      puts "NAME Actual: "+age
  end
  if (ocupacionXPATH != textOcupation) 
      raise "Validation for user ocupation: Failed"    
      puts "Expected: "
      puts "OCUPACION Expected: "+textOcupation

      puts "Actual:"
      puts "OCUPACION Actual: "+ocupacionXPATH
  end
  if ((carrerXPATH != textProfession) && (phoneXPATH != textPhoneNumber) && (cityOfResidenceXPATH != textCityOfResidence) && (countryOfResidenceXPATH != textCountryOfResidence) && (emergencyContactNamePATH != textEmergencyContactName) && (relationshipToEmergencyContactPATH != textRelationshipToEmergencyContact) && (emergencyContactNumberPATH != textEmergencyContactNumber) && (interestsPATH != textInterests) && (qualitiesPATH != textQualities))
      raise "Validation for user carrer: Failed"    
      puts "Expected: "
      puts "CARRERA Expected: "+textProfession

      puts "Actual:"
      puts "CARRERA Actual: "+carrerXPATH
  end
  if (phoneXPATH != textPhoneNumber) 
      raise "Validation for user number of phone: Failed"    
      puts "Expected: "
      puts "NUMERO DE TELEFONO Expected: "+textPhoneNumber

      puts "Actual:"
      puts "NUMERO DE TELEFONO  Actual: "+phoneXPATH
  end
  if (cityOfResidenceXPATH != textCityOfResidence) 
      raise "Validation for user city of Residence: Failed"    
      puts "Expected: "
      puts "CIUDAD DE RESIDENCIA Expected: "+textCityOfResidence

      puts "Actual:"
      puts "CIUDAD DE RESIDENCIA Actual: "+cityOfResidenceXPATH
  end
  if (countryOfResidenceXPATH != textCountryOfResidence) 
      raise "Validation for user country of Residence: Failed"    
      puts "Expected: "
      puts "PAIS DE RESIDENCIA Expected: "+textCountryOfResidence

      puts "Actual:"
      puts "PAIS DE RESIDENCIA Actual: "+countryOfResidenceXPATH
  end
  if (emergencyContactNamePATH != textEmergencyContactName)
      raise "Validation for user emergencyContactName: Failed"    
      puts "Expected: "
      puts "CONTACTO DE EMERGENCIA Expected: "+textEmergencyContactName

      puts "Actual:"
      puts "CONTACTO DE EMERGENCIA Actual: "+emergencyContactNamePATH
  end
  if (relationshipToEmergencyContactPATH != textRelationshipToEmergencyContact)
      raise "Validation for user relationshipToEmergencyContact: Failed"    
      puts "Expected: "
      puts "RELACION DE EMERGENCIA Expected: "+textRelationshipToEmergencyContact

      puts "Actual:"
      puts "RELACION DE EMERGENCIA Actual: "+relationshipToEmergencyContactPATH
  end
  if (emergencyContactNumberPATH != textEmergencyContactNumber)
      raise "Validation for user emergencyContactNumber: Failed"    
      puts "Expected: "
      puts "NUMERO DE CONTACTO DE EMERGENCIA Expected: "+textEmergencyContactNumber

      puts "Actual:"
      puts "NUMERO DE CONTACTO DE EMERGENCIA DE EMERGENCIA Actual: "+emergencyContactNumberPATH
  end
  if(interestsPATH != textInterests)
    raise "Validation for user interests: Failed"    
    puts "Expected: "
    puts "INTERESES Expected: "+textInterests

    puts "Actual:"
    puts "INTERESES Actual: "+interestsPATH
  
  end
  if(qualitiesPATH != textQualities)
    raise "Validation for user qualities: Failed"    
    puts "Expected: "
    puts "QUALITIES Expected: "+textQualities

    puts "Actual:"
    puts "QUALITIES Actual: "+qualitiesPATH
  
  end
  if(descriptionXPATH != textdescription)
    raise "Validation for user description: Failed"    
    puts "Expected: "
    puts "DESCRIPTION Expected: "+textdescription

    puts "Actual:"
    puts "DESCRIPTION Actual: "+descriptionXPATH
  
  end
end