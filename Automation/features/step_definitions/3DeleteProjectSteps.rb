countCardsBeforeDelete = 0
When('I press the button to delete a project {string}') do |string|
    cardElement = '//*[@id="root"]/div/div[2]/div'
    countBeforeDelete = page.all(:xpath, cardElement).length

    buttonDelete = find(:xpath, '//*[@id="root"]/div/div[2]/div[1]/div[2]/div/button[2]')
    buttonDelete.click
    countCardsBeforeDelete = countBeforeDelete - 1
    sleep(1)
  end
  
  Then('the number of project cards decreases by one') do
    cardElement = '//*[@id="root"]/div/div[2]/div'
    countAfterDelete = page.all(:xpath, cardElement).length

    if countCardsBeforeDelete != countAfterDelete
        raise "The count should be "+ countCardsBeforeDelete	
    end
  end