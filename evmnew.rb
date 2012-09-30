require './orderclass'


extra_value_menu = {:meals => {'1' =>{:name => 'Big Mac', :price => 5.00},
								'2' =>{:name => 'Quarter Pounder', :price => 5.25}}, 
					:drinks => ["coke", "sprite", "dr.pepper"]}


session = DriveThru.new(extra_value_menu)

session.start