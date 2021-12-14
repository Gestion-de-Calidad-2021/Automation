#You can implement step definitions for undefined steps with these snippets:

When(/^the "([^"]*)" click on Eventos option.$/) do |user|
    buttonEventos_xpath='//*[@id="root"]/header/div[2]/div/button[3]'
    find(:xpath, buttonEventos_xpath).click
end

When(/^click on Eliminar button of Evento Académico 2021/) do
    
    buttonEliminarEvento_xpath='//*[@id="root"]/div/div[2]/div/div[24]/div[1]/div[3]/div/button[3]'
    find(:xpath, buttonEliminarEvento_xpath).click
end

Then(/^the "([^"]*)" return to the Eventos option$/) do |user|
    url = URI.parse(current_url)
    if(url.to_s!='https://testing-start.web.app/')
        raise "Validation return to the home page: Failed"  
    end
end

Then(/^the event doesn't exist in the Eventos option$/) do
    buttonVerEvento_xpath='//*[@id="root"]/div/div[2]/div/div[24]/div[1]/div[2]/div/button[2]'
    find(:xpath, buttonVerEvento_xpath).click
end