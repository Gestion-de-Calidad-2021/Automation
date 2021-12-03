Given('I am on the main homepage of StartAmericas website') do
    visit 'https://testing-start.web.app/'
end
  
When('I press the login button ubicate at the right corner') do
    buttonLogin_xpath='//*[@id="root"]/header/div[1]/button'
    find(:xpath, buttonLogin_xpath).click
end

When(/^I enter as "([^"]*)"$/) do |typeOfUser|
    if(typeOfUser== "voluntario")
        fill_in 'email', :with => ENV['VOLUNTARIO_USER']

    elsif(typeOfUser== "lider")
        fill_in 'email', :with => ENV['LIDER_USER']
    end
    
end

When('I enter the password') do 
    fill_in 'password', :with => ENV['PSW']

end

When(/^I click the "([^"]*)" button$/) do |string|
    puts string
    buttonIniciarSesion_xpath='//*[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep 2
end

Then('I should enter at the main page and see the proyects and events') do
    itemLogOut='//*[@id="root"]/header/div[1]/button/span[1]'
    if find(:xpath,itemLogOut).text != "LOG OUT"
        raise "Is not logged in"
    end    
end