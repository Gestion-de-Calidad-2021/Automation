Given('I am on the main homepage of Start Americas Together Website') do
  visit 'https://testing-start.web.app/'
  buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
  find(:xpath, buttonLogin_xpath).click
  fill_in 'email', :with => ENV['VOLUNTARIO_USER']
  fill_in 'password', :with => ENV['PSW']
  buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
  find(:xpath, buttonIniciarSesion_xpath).click
  sleep(2)
end

When('I press the sections of {string}') do |string|
  buttonEventos=find(:xpath, '/html/body/div/header/div[2]/div/button[3]/span[1]')
  buttonEventos.click
  sleep(1)
end

When('I press the button of {string} in the Test Event Lider') do |string|
  participateButton='/html/body/div/div/div[2]/div/div[6]/div[1]/div[2]/div/button[1]'
  find(:xpath, participateButton).click
  sleep(1)
  page.driver.browser.switch_to.alert.accept
  sleep(1)
end

Then('I should be participating in Test Event Lider with the option of {string}') do |string|
  participateButton='/html/body/div/div/div[2]/div/div[6]/div[1]/div[2]/div/button[1]'
  buttonDesparticipate=find(:xpath, participateButton)
  if buttonDesparticipate.text != string
    raise "The message should be"+ string	
  end
  sleep(1)
  buttonDesparticipate.click
  sleep(1)
end