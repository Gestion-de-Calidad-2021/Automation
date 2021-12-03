#You can implement step definitions for undefined steps with these snippets:

Given('the leader user is logged with the email and password on Start Americas Together homepage') do
  visit 'https://testing-start.web.app/'
  buttoLogin_xpath = '/html/body/div/header/div[1]/button'
  find(:xpath, buttoLogin_xpath).click
  fill_in 'email', :with => ENV['LIDER_USER']
  fill_in 'password', :with => ENV['PSW']
  buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
  find(:xpath, buttonIniciarSesion_xpath).click
  sleep(2)
end

Given('I press the Proyectos button') do
  buttonProyectos = find(:xpath, '//*[@id="root"]/header/div[2]/div/button[2]')
  buttonProyectos.click
  sleep(1)
end

When('I press the button to create a new proyect {string}') do |string|
  buttonCrearProyectos = find(:xpath, '//*[@id="root"]/div/div[1]/button')
  buttonCrearProyectos.click
  sleep(1)
end

When('I enter the required fields for a new project as show below') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
    when "Titulo:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[1]/input').set(value)
    when "Descripcion:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[2]/input').set(value)
    when "Objetivo:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[3]/input').set(value) 
    when "Lider:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[4]/input').set(value)        
    end  
  end
  sleep(2)
end

When('click on CREAR button') do
  buttonCrear = find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[5]/input')
  buttonCrear.click
  sleep(1)
end

Then('a card is created with the project according to the following data') do |table|
  dataRes = table.rows_hash
  dataRes.each_pair do |key, value|
    case key
    when "Proyecto:"
      #//*[@id="root"]/div/div[2]/div[6]/div[2]/p[1]
      textProyecto = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[1]')
      txt = textProyecto.text.split("Proyecto: ").join("")
      if txt != value
        raise "The message should be "+ value
      end
      
    when "Objetivo:"
      textObjetivo = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[2]')
      txt = textObjetivo.text.split("Objetivo: ").join("")
      if txt != value
        raise "The message should be "+ value	
      end

    when "Descripcion:"
      textDescripcion = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[3]')
      txt = textDescripcion.text.split("Descripción: ").join("")
      if txt != value
        raise "The message should be "+ value	
      end

    when "Lider:"
      textLider = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[4]')
      txt = textLider.text.split("Lider: ").join("")
      if txt != value
        raise "The message should be "+ value	
      end
    end  
  end
  sleep(2)
end

#Scenario #2
countCards = 0
Given('the leader user logged into the Start Americas Together home page') do
  visit 'https://testing-start.web.app/'
  buttoLogin_xpath = '/html/body/div/header/div[1]/button'
  find(:xpath, buttoLogin_xpath).click
  fill_in 'email', :with => ENV['LIDER_USER']
  fill_in 'password', :with => ENV['PSW']
  buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
  find(:xpath, buttonIniciarSesion_xpath).click
  sleep(2)
end

Given('I press the Projects section button') do
  buttonProyectos = find(:xpath, '//*[@id="root"]/header/div[2]/div/button[2]')
  buttonProyectos.click
  sleep(1)
end

When('I press the button to create a new proyect') do
  cardElement = '//*[@id="root"]/div/div[2]/div'
  countBeforeCancel = page.all(:xpath, cardElement).length
  countCards = countBeforeCancel
  buttonCrearProyectos = find(:xpath, '//*[@id="root"]/div/div[1]/button')
  buttonCrearProyectos.click
  sleep(1)
end

When('I input the data for a new project as shown below') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
    when "Titulo:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[1]/input').set(value)
    when "Descripcion:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[2]/input').set(value)
    when "Objetivo:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[3]/input').set(value) 
    when "Lider:"
      find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[4]/input').set(value)        
    end  
  end
  sleep(2)
end

When('click on CANCELAR button') do
  bottonCancelar = find(:xpath, '//*[@id="gen-form"]/button')
  bottonCancelar.click
  sleep(1)
end

Then('the number of cards did not increase') do
  x = '//*[@id="root"]/div/div[2]/div'
  countAfterCancel = page.all(:xpath, x).length
  if countCards != countAfterCancel
    raise "The count should be "+ countCards	
  end
end