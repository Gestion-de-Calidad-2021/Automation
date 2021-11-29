Given('I am on the main homepage') do
    visit 'https://testing-start.web.app/'
end
  
When('I press the login button') do
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click
end

When('I enter required fields as shown below') do |table|
    data = table.rows_hash
    fill_in 'email', :with => data["Correo electronico:"]
    fill_in 'password', :with => data["Contraseña:"]
end

When('I click the {string} button') do |string|
    buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep 1
end

Then('I should enter at the main page with the voluntario privileges') do
    itemLogOut='//*[@id="root"]/header/div[1]/button/span[1]'
    if find(:xpath,itemLogOut).text != "LOG OUT"
        raise "Is not logged in"
    end    
end