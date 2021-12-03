#You can implement step definitions for undefined steps with these snippets:

When(/^the "([^"]*)" click on Eventos option$/) do |user|
    buttonEventos_xpath='//*[@id="root"]/header/div[2]/div/button[3]'
    find(:xpath, buttonEventos_xpath).click
end

When(/^the "([^"]*)" click on Crear Evento Button$/) do |user|
    #pending # Write code here that turns the phrase above into concrete actions
   
    #find(:css, "//*[@id="root"]/div/div[1]/div[2]/a[1]").click
    #find('div/div[1]/div[2]/a[1]').click
    buttonCrearEventos_xpath='//*[@id="root"]/div/div[1]/div[2]/a[1]'
    find(:xpath, buttonCrearEventos_xpath).click
    sleep 2
  end
  
  When(/^the "([^"]*)" enter required fields to create event as shown below$/) do |user, table|
    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
    data = table.rows_hash
    fill_in 'nombre_evento', :with => data["name of the event:"]
    sleep 1
    fill_in 'descripcion_evento', :with => data["description:"]
    sleep 1
    fill_in "fecha_evento", with: data["date:"] 
    sleep 1
    select data["mode:"], :from => "modalidad_evento" 
    sleep 1
    fill_in 'lugar_evento', :with => data["site:"]
    sleep 1
  end
  
  When(/^the "([^"]*)" click on Registrar Evento$/) do |user|
      buttonRegistrarEvento_xpath='//*[@id="root"]/div/form/div[4]/button[1]'
      find(:xpath, buttonRegistrarEvento_xpath).click
  end
  
  Then(/^the platform show an alert box in Eventos$/) do
    sleep 3
    text = page.driver.browser.switch_to.alert.text
    puts text
    expect(text).to eq 'Evento Guardado'
  end

  Then(/^the "([^"]*)" click on Aceptar Button$/) do |user|
      sleep 3
      page.driver.browser.switch_to.alert.accept
  end
  
  Then(/^the "([^"]*)" can see the event "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" created on "([^"]*)" option$/) do |user, nameOfEvent, description, mode, site, date, eventos|  
      #eventName = find(:xpath,'//*[@id="root"]/div/div[2]/div/div[2]/div[1]/div[2]/div/h4').text
      #nameE=all('.card-title').last.text
      #puts "NOMBRE DEL EVENTO OBTENIDO POR CSS: "+nameE
      #sleep 3
      
      x = '//*[@id="root"]/div/div[2]/div'
      countAfterCancel = page.all(:xpath, x).length


      textName = eventName
      
      puts "NAME EVENT Actual: "+nameOfEvent
      puts "NAME EVENT Expected: "+textName
  
      descriptionXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div[2]/div[1]/div[2]/div/p[1]').text
                            #//*[@id="root"]/div/div[2]/div/div[93]/div[1]/div[2]/div/p[1]
      puts "DESCRIPTION Actual: "+descriptionXPATH
    
      textDescriptionn = "Description: "+description
      puts "DESCRIPTION Expected: "+textDescriptionn
  
      modeXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div[2]/div[1]/div[2]/div/p[2]').text
      puts "MODALIDAD Actual: "+modeXPATH
    
      textMode = "Modalidad: "+mode
      puts "MODALIDAD Expected: "+textMode
  
    
      dateXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div[2]/div[1]/div[2]/div/p[3]').text
      puts "FECHA Actual: "+dateXPATH
      
      textDate = "Fecha: "+date
      puts "FECHA Expected: "+textDate
    
      siteXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div[2]/div[1]/div[2]/div/p[4]').text
      puts "LUGAR Actual: "+siteXPATH
    
      textSite = "Lugar: "+date
      puts "LUGAR Expected: "+textSite
    
      
      sleep 2
      if (nameOfEvent != textName) 
          raise "Validation for event name: Failed"    
          puts "Expected: "
          puts "NAME Expected: "+textName
    
          puts "Actual:"
          puts "NAME Actual: "+nameOfEvent
      end
      if (descriptionXPATH != textDescriptionn) 
          raise "Validation for event description: Failed"    
          puts "Expected: "
          puts "DESCRIPCION Expected: "+textDescriptionn
    
          puts "Actual:"
          puts "DESCRIPCION Actual: "+descriptionXPATH
      end
      if (modeXPATH != textMode) 
          raise "Validation for event mode: Failed"    
          puts "Expected: "
          puts "MODALIDAD Expected: "+textMode
    
          puts "Actual:"
          puts "MODALIDAD Actual: "+modeXPATH
      end
      if (dateXPATH != textDate) 
          raise "Validation for event date: Failed"    
          puts "Expected: "
          puts "FECHA Expected: "+textDate
    
          puts "Actual:"
          puts "FECHA Actual: "+dateXPATH
      end
      if (siteXPATH != textSite) 
          raise "Validation for event site: Failed"    
          puts "Expected: "
          puts "LUGAR Expected: "+textSite
    
          puts "Actual:"
          puts "LUGAR Actual: "+siteXPATH
      end
      
  end