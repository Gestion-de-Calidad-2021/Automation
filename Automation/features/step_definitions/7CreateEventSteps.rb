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
    sleep 1
  end
  
  When(/^the "([^"]*)" enter required fields to create event as shown below$/) do |user, table|
    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
    data = table.rows_hash
    fill_in 'nombre_evento', :with => data["name of the event:"]

    fill_in 'descripcion_evento', :with => data["description:"]

    fill_in "fecha_evento", with: data["date:"] 

    select data["mode:"], :from => "modalidad_evento" 

    fill_in 'lugar_evento', :with => data["site:"]

  end
  
  When(/^the "([^"]*)" click on Registrar Evento$/) do |user|
      buttonRegistrarEvento_xpath='//*[@id="root"]/div/form/div[4]/button[1]'
      find(:xpath, buttonRegistrarEvento_xpath).click
  end
  
  Then(/^the platform show an alert box in Eventos$/) do
    sleep 2
    text = page.driver.browser.switch_to.alert.text
    puts text
    expect(text).to eq 'Evento Guardado'
  end

  Then(/^the "([^"]*)" click on Aceptar Button$/) do |user|
      sleep 3
      page.driver.browser.switch_to.alert.accept
  end
  
  Then(/^the "([^"]*)" can see the event "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" created on "([^"]*)" option$/) do |user, nameOfEvent, description, mode, site, date, eventos|      
      x = '//*[@id="root"]/div/div[2]/div/div'
      countCardsEvent = page.all(:xpath, x).length
      puts "CONTADOR NAME: "+countCardsEvent.to_s
      eventName = find(:xpath,'//*[@id="root"]/div/div[2]/div/div['+countCardsEvent.to_s+']/div[1]/div[2]/div/h4').text
      #nameE=all('.card-title').last.text
      puts "NOMBRE DEL EVENTO OBTENIDO POR CSS: "+eventName

      textName = eventName
      
      puts "NAME EVENT Actual: "+nameOfEvent
      puts "NAME EVENT Expected: "+textName
      
      descriptionXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div['+countCardsEvent.to_s+']/div[1]/div[2]/div/p[1]').text
      puts "DESCRIPTION Actual: "+descriptionXPATH
    
      textDescriptionn = "Description: "+description
      puts "DESCRIPTION Expected: "+textDescriptionn
  
      modeXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div['+countCardsEvent.to_s+']/div[1]/div[2]/div/p[2]').text
      puts "MODALIDAD Actual: "+modeXPATH
    
      textMode = "Modalidad: "+mode
      puts "MODALIDAD Expected: "+textMode
  
    
      dateXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div['+countCardsEvent.to_s+']/div[1]/div[2]/div/p[3]').text
      array = dateXPATH.split
      puts "ARRAY : "+array.to_s
      dateArray = array.last.split('-')
      puts "ARRAY DATE: "+dateArray.to_s
      datePATH=dateArray[2].to_s+"/"+dateArray[1].to_s+"/"+dateArray[0].to_s

      puts "FECHA Actual: "+datePATH
      textDate = date
      puts "FECHA Expected: "+textDate
    
      siteXPATH = find(:xpath,'//*[@id="root"]/div/div[2]/div/div['+countCardsEvent.to_s+']/div[1]/div[2]/div/p[4]').text
      puts "LUGAR Actual: "+siteXPATH
    
      textSite = "Lugar: "+site
      puts "LUGAR Expected: "+textSite
    
      
      sleep 1
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
      if (datePATH != textDate) 
          raise "Validation for event date: Failed"    
          puts "Expected: "
          puts "FECHA Expected: "+textDate
    
          puts "Actual:"
          puts "FECHA Actual: "+datePATH
      end
      if (siteXPATH != textSite) 
          raise "Validation for event site: Failed"    
          puts "Expected: "
          puts "LUGAR Expected: "+textSite
    
          puts "Actual:"
          puts "LUGAR Actual: "+siteXPATH
      end
      

      

      
  end