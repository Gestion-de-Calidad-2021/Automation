#You can implement step definitions for undefined steps with these snippets:

Given(/^the "([^"]*)" is logged with the email and password on Start Americas Together homepage$/) do |user|
    visit 'https://testing-start.web.app/'    
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click

    if(user== "voluntario user")
        fill_in 'email', :with => ENV['VOLUNTARIO_USER']
    elsif(user== "lider user")
        fill_in 'email', :with => ENV['LIDER_USER']
    end
    fill_in 'password', :with => ENV['PSW']
    buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep 15
  end
  
  
  When(/^click on ELIMINAR PERFIL$/) do
    buttonEliminarPerfil_xpath='//*[@id="simple-tabpanel-0"]/div/span/div/div[1]/div[2]/div/div[2]/button[2]'
    find(:xpath, buttonEliminarPerfil_xpath).click 
  end
  
  Then(/^the "([^"]*)" click on Aceptar$/) do |user|
    sleep 3
    page.driver.browser.switch_to.alert.accept
  end
  
  Then(/^the "([^"]*)" return to the home page$/) do |user|
    url = URI.parse(current_url)
    if(url.to_s!='https://testing-start.web.app/')
        raise "Validation return to the home page: Failed"  
    end
  end
  
  Then(/^the "([^"]*)" doesn't have access to the Start Americas Together$/) do |user|
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
  end
