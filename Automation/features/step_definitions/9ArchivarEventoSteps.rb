Given('I am on the main homepage of Start Americas Together Website.') do
  visit 'https://testing-start.web.app/'
  buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
  find(:xpath, buttonLogin_xpath).click
  fill_in 'email', :with => ENV['VOLUNTARIO_USER']
  fill_in 'password', :with => ENV['PSW']
  buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
  find(:xpath, buttonIniciarSesion_xpath).click
  sleep(2)
end

When('I press the sections of {string}.') do |string|
  buttonEventos=find(:xpath, '/html/body/div/header/div[2]/div/button[3]/span[1]')
  buttonEventos.click
  sleep(1)
end

When('I press the button of {string} of the fourth event') do |string|
  @name=find(:xpath, '/html/body/div/div/div[2]/div/div[4]/div[1]/div[2]/div/h4').text
  find(:xpath, '/html/body/div/div/div[2]/div/div[4]/div[1]/div[3]/div/button[2]').click
  
end

Then('I shouldnt see the event in the events main page, but can see it in {string}') do |string|
  find(:xpath, '/html/body/div/div/div[1]/div[2]/button').click
  cardname=find(:xpath, '/html/body/div/div/div[2]/div/div[2]/div[1]/div[2]/div/h4')
  if(cardname.text!=@name)
    raise cardname+" is not the same of "+@name
  end
  find(:xpath, '/html/body/div/div/div[2]/div/div[2]/div[1]/div[3]/div/button[1]').click

end