#You can implement step definitions for undefined steps with these snippets:



Given(/^the voluntario user is logged with the email and password on Start Americas Together homepage$/) do 
    visit 'https://testing-start.web.app/'
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click
    fill_in 'email', :with => ENV['VOLUNTARIO_USER']
    fill_in 'password', :with => ENV['PSW']
    buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep 5
  end
  
  When(/^the voluntario user click on "([^"]*)" option$/) do |perfilButton|
    buttonPerfil_xpath='//*[@id="root"]/header/div[2]/div/button[4]'
    find(:xpath, buttonPerfil_xpath).click
  end
  
  When(/^click on EDITAR PERFIL$/) do
    buttonEditarPerfil_xpath='//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[2]/button[1]'
    find(:xpath, buttonEditarPerfil_xpath).click
  end
  
  When(/^the voluntario user will update his name to Juan$/) do 
    fill_in 'Nombre', :with => 'Juan'
  end

  When(/^click on GUARDAR$/) do
    buttonGuardar_xpath='/html/body/div[2]/div[3]/div[2]/button[1]'
    find(:xpath, buttonGuardar_xpath).click
  end
  
  Then(/^the voluntario user can see his name updated on the Perfil information with "([^"]*)"$/) do |name|
    userName = find(:xpath,'//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[1]/div/p[1]').text
    textName = "Nombre: "+name  
    if (userName != textName)
        raise "Validation for user name: Failed"    
        puts "Expected: "+textName
        puts "Actual:"+userName
    end
  end
