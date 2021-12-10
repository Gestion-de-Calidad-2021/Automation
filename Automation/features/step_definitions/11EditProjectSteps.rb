When('I press the button to edit the first project') do
  elementEdit = '//*[@id="root"]/div/div[2]/div[1]/div[2]/div/button[1]'
  buttonEditarProyectos = find(:xpath, elementEdit)
  buttonEditarProyectos.click
  sleep(1) 
end

When('I put in the fields for the first project the new values or data show below') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
  case key
      when "Titulo:"
          find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[1]/input').set(value)
      when "Descripcion:"
          find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[2]/input').set(value)
      when "Objetivo:"
          find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[3]/input').set(value) 
      when "Lider:"
          find(:xpath, '//*[@id="gen-form"]/form/div[2]/div[4]/input').set(value)        
      end  
  end
  sleep(2)
end

When('click on EDITAR button') do
  editar = find(:xpath, '/html/body/div/div/div[2]/form/div[2]/div[6]/input')
  editar.click
  sleep(2)
end

Then('the project is edited according to the following data') do |table|
  dataRes = table.rows_hash
  dataRes.each_pair do |key, value|
  case key
  when "Proyecto:"
    textProyecto = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[1]')
    txt = textProyecto.text.split("Proyecto: ").join("")
    if txt != value
      raise "The message should be "+ value
    end
    
  when "Objetivo:"
    textObjetivo = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[2]')
    txt = textObjetivo.text.split("Objetivo: ").join("")
    if txt != value
      raise "The message should be "+ value	
    end

  when "Descripcion:"
    textDescripcion = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[3]')
    txt = textDescripcion.text.split("DescripciÃ³n: ").join("")
    if txt != value
      raise "The message should be "+ value	
    end

  when "Lider:"
    textLider = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/p[4]')
    txt = textLider.text.split("Lider: ").join("")
    if txt != value
      raise "The message should be "+ value	
    end
  end  
end
sleep(2)
end