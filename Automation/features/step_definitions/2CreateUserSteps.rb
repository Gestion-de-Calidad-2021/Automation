Given('I am on the main homepage of Start Amercias Together Website') do
    visit 'https://testing-start.web.app/'    
    sleep(1)
end

When('I press the login  button ubicated at the right corner') do
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click
end

When('I press the crear cuenta nueva button') do
    buttonCrear_xpath='/html/body/div/div/div[2]/div/form/div[3]/button[2]/span[1]'
    find(:xpath, buttonCrear_xpath).click
    sleep(1)
end
When('I enter the required fields as show below to') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
      print(key)
      case key
      when "Correo electronico:"
        fill_in 'email' , :with => value
        
      when "Nombre:"
        fill_in 'username' , :with => value
        
      when "Apellido:"
        fill_in 'lastname' , :with => value
        
      when "Numero de telefono:"
        fill_in 'phone' , :with => value
        
      when "Contraseña:"
        fill_in 'password' , :with => value
        
      when "Confirma tu Contraseña:"
        fill_in 'confirmPassword' , :with => value        
      end  
    end
    sleep(2)
end
When('I press Crear Cuenta start') do
    buttonCrear_xpath='/html/body/div/div/div/div[2]/div[2]/form/div[6]/button/span[1]'
    find(:xpath, buttonCrear_xpath).click   
    sleep (2)
end

Then('the user will be created and can login with the next credentials') do |table|
    data = table.rows_hash
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click
    fill_in 'email', :with => data['Correo electronico:']
    fill_in 'password', :with => data['Contraseña:']
    sleep (2)
end

Then('phone camp should show me a waring of incorrect phone format') do
  messageCamp=find(:xpath, '/html/body/div/div/div/div[2]/div[2]/form/div[2]/div[3]/p')
  if messageCamp.text != "Campo no valido"
      raise "The phone number should show that the format is incorrect "
  end
end