

# evm = [{:name => "Big Mac", :price => 5.89 },
#        {:name => "Quarter Pounder", :price => 5.39},
#        {:name => "Double Quarter Pounder", :price => 6.39}
#        ]




apology = "sorry I don't understand, please type 'Y' to see our Extra Value Menu or 'N' to drive away (or 'quit' to exit)"
sendoff = "mmkay bye bye now"

def get_user_command
  gets.chomp.strip.downcase
end



def displaymenu
  extra_value_menu = [{:'Big Mac' => 5.89}, 
         {:'Quarter Pounder' => 5.39}, 
         {:'Double Quarter Pounder' => 6.39} 
     ]
  extra_value_menu.each_with_index do |meal, index|
     meal.each do |k, v|
    puts "##{index+1} - #{k} - #{v}"
   end
 end
end




def choose_meal


  
  puts "Choose from the following:"

  displaymenu
  puts "Which number meal would you like?"

  meal_choice = (gets.chomp.to_i) - 1

  

  if extra_value_menu.rindex(meal_choice) != nil
    puts "This meal exists"
    # insert meal choice into hash
  else 
    puts "Sorry that doesn't exist, try again"
  end
end

  






#   if extra_value_menu[meal_choice] != nil
#     extra_value_menu[meal_choice].each do |k,v|
#     puts "You've chosen the #{k} meal. What would you like to drink (Coke/Sprite/Dr.Pepper)?"
#     drink_choice = get_user_command.capitalize
    
    
#         puts "#{drink_choice}, good pick! Would you like to super-size that?(Y/N)"
#         supersize = get_user_command
      
#       case supersize
#       when  "y"
#           extra_value_menu[meal_choice].each do |k,v|
#           supersizeprice = v*1.5
#           puts "Great! Your supersized #{k} meal with a #{drink_choice} costs $#{supersizeprice}"
#         end
#       when  "n" 
#           extra_value_menu[meal_choice].each do |k,v|
#           regprice = v
#           puts "Ok! Your #{k} meal with a #{drink_choice} costs $#{regprice}"
#         end
#       else
#         puts "something"
#       end
#     end

#   else
#     puts "that's not on the menu, try again"
#     sleep 1
#   end
# end



puts "Welcome to Macdonalds drive-thru, would you like to see our Extra Value Menu?(Y/N or 'Quit' to exit)"
input = get_user_command

while input != "quit"

# puts "Enter a command:"
# 
  case input
   when "y"
    choose_meal
    puts "Breaking loop worked"
    
   when "n"
    puts sendoff
    break
   else
    puts apology
    input = get_user_command
  end
end


#this is a change



#this is a comment  

