
#Given I am on the GMO On Line homepage
Given(/^I am on the GMO On Line homepage$/) do
	page.driver.browser.manage.window.maximize
    visit 'http://demo.borland.com/gmopost/'
    @priceTent=299.99
    @priceBackPack=179.95
    @priceGlasses=67.99
    @priceSocks=19.99
    @priceBoots=109.90
    @priceShorts=24.95
end

#And I click the "Enter GMO Online" button
#Given(/^I click the "([^"]*)" button$/) do |buttonLabel|
Given('I click the {string} button') do |string|
  click_on ('Enter GMO OnLine')
end

#When I buy the items as show below
When(/^I buy the items as show below$/) do |table|
  data = table.rows_hash
  @rowCounter = 0
  @grandTotal = 0
  totalTents=0
  totalBackPack=0
  totalGlasses=0
  totalSocks=0
  totalBoots=0
  totalShorts=0
  data.each_pair do |key, value|
  	if value.to_i >0
  		@rowCounter +=1
  	end 
  	case key
    	when "3 Person Dome Tent"
		  fill_in 'QTY_TENTS', :with => value
		  totalTents = value.to_i * @priceTent	 
		when "External Frame Backpack"
		  fill_in 'QTY_BACKPACKS', :with => value
		  totalBackPack = value.to_i * @priceBackPack
		when "Glacier Sun Glasses"
		  fill_in 'QTY_GLASSES', :with => value	 
		  totalGlasses = value.to_i * @priceGlasses	 
	    when "Padded Socks"
		  fill_in 'QTY_SOCKS', :with => value	 
		  totalSocks = value.to_i * @priceSocks	 
    	when "Hiking Boots"
		  fill_in 'QTY_BOOTS', :with => value	 
		  totalBoots = value.to_i * @priceBoots 	 
    	when "Back Country Shorts"
		  fill_in 'QTY_SHORTS', :with => value	 
		  totalShorts = value.to_i * @priceShorts	 
     end
  end
  @grandTotal=totalTents+totalBackPack+totalGlasses+totalSocks+totalBoots+totalShorts
  tax = 0.05*@grandTotal
  shipping = 5
  @grandTotal=@grandTotal+tax+shipping
  @grandTotal=@grandTotal.floor(2)
  puts "ONLY FOR TESTING PURPOSES - calculated total"
  puts @grandTotal 
end

#And I place the order
When(/^I place the order$/) do
  click_on ('Place An Order')
end

#Then the grand total is equal to 1234.12 $us
Then(/^the grand total is equal to (\d+)\.(\d+) \$us$/) do |intPart, decPart|
    xpathBase = '/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody'
    rowCounter = @rowCounter + 5
    xpathBase = find(:xpath, xpathBase)
    xpathGrandTotal = './tr[%i]/td[2]'
    expect(xpathBase.find(:xpath, xpathGrandTotal % [rowCounter])).to have_content(@grandTotal.to_s)
    labelTotal = xpathBase.find(:xpath, xpathGrandTotal % [rowCounter]).text
    labelTotalCalculated = "$ "+@grandTotal.to_s
    if labelTotalCalculated  != labelTotal
      raise "Expected grand total does not match calculated grand total "
    end
    puts "ONLY FOR TESTING PURPOSES - Invoice values"
    puts labelTotalCalculated
    puts labelTotal
end

