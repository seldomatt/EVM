require './orderclass'


extra_value_menu = {:meals => {1 =>{:name => 'Big Mac', :price => 5.00},
								2 =>{:name => 'Quarter Pounder', :price => 5.25}}, 
					:drinks => ["coke", "sprite", "dr.pepper"]}



session = DriveThru.new(extra_value_menu)
session.start




# puts "What meal number?"

# input = gets.chomp.to_i

# order = Orders.new(input)

# order.name= extra_value_menu[order.mealnum][:name]
# order.price= extra_value_menu[order.mealnum][:price]



# puts order.inspect

# puts "Do you want to supersize?"

# input = gets.chomp.downcase

# if input == 'y'
# 	order.supersize
# 	puts order.price
# elsif input == 'n'
# 	puts order.price
# else 
# 	puts "Foo"
# end






