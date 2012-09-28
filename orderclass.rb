class Orders

	attr_accessor :mealnum, :drink, :name, :price

	def initialize(m,n,p)
		@mealnum = m
		@drink = "None"
		@name = n
		@price = p
	end

	def supersize
		@price= @price * 1.5
	end

end

class Outputter

	def self.welcome_message
		puts "Welcome to McDonald's.  Type 'driveup' to see our menu!"
	end

	def self.no_command_error
		puts "Sorry, didn't understand that command"
	end

	def self.meal_choice_prompt
		puts "Which meal would you like? (type '1', '2', etc.)"
	end

	def self.no_choice_error
		puts "Sorry, that's not a choice, please try again"
	end

	def self.meal_choice_confirm(order)
		puts "A #{order.name} meal, great choice!"
	end

	def self.drink_choice_prompt(order)
		puts "What kind of drink would you like with your #{order.name}"
	end

	def self.drink_choice_confirm(order)
		puts "Ok, so that's a #{order.name} meal with a #{order.drink}"
	end

end


class DriveThru 

	def initialize(menu)
		@menu = menu
		# is this initialize stupid?
	end

	def start

		Outputter.welcome_message

		custinput = gets.downcase.chomp

		if custinput == 'driveup'
			choose_meal
		else 
			Outputter.no_command_error
		end
	end

	def display_menu
		@menu[:meals].each do |number, name_price|
			puts "#{number} - #{name_price[:name]} - #{name_price[:price]}"
		end
	end


	def choose_meal

		display_menu

		Outputter.meal_choice_prompt 

		mealchoice = gets.chomp.to_i

		if @menu[:meals].has_key?(mealchoice)
			order = Orders.new(mealchoice, @menu[:meals][mealchoice][:name], @menu[:meals][mealchoice][:price])
			Outputter.meal_choice_confirm(order)
			choose_drink(order)
		else 
			Outputter.no_choice_error
		end
	
	end

	def display_drinks
		@menu[:drinks].each do |drink|
			puts "a #{drink.capitalize}?"
		end
	end


	def choose_drink(order)
		Outputter.drink_choice_prompt(order)
		
		display_drinks

		drinkchoice = gets.chomp.downcase

		if @menu[:drinks].include?(drinkchoice)
			order.drink = drinkchoice.capitalize
			Outputter.drink_choice_confirm(order)
			supersize(order)
		else 
			Outputter.no_choice_error
		end

	end

	def supersize(order)
	end 











end