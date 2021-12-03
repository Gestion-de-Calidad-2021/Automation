Given('I am logged as a volunteer with the email and password on Start Americas Together homepage') do
    visit 'https://testing-start.web.app/'
    buttoLogin_xpath = '/html/body/div/header/div[1]/button'
    find(:xpath, buttoLogin_xpath).click
    fill_in 'email', :with => ENV['VOLUNTARIO_USER']
    fill_in 'password', :with => ENV['PSW']
    buttonIniciarSesion_xpath='//[@id="root"]/div/div[2]/div/form/div[3]/button[1]'
    find(:xpath, buttonIniciarSesion_xpath).click
    sleep(2)
  end

Given('I press the {string} section of the main page') do |string|
    buttonProyectos = find(:xpath, '//[@id="root"]/header/div[2]/div/button[2]')
    buttonProyectos.click
    sleep(1)
  end

When('I press the {string} button a project') do |string|
    elementParticipateButton = '/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div/button'
    participateButton = find(:xpath, elementParticipateButton)
    participateButton.click
    sleep(1)
  end

Then('it should show me a confirmation message with the following message {string} and an OK button') do |string|
    messageConfirmation = find(:xpath, '//*[@id="alert-dialog-title"]/h2')
    if messageConfirmation.text != string
        raise "The count should be "+ string
    end
  end