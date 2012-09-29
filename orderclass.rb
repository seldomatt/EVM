require './outputter'

class Orders

	attr_accessor :mealnum, :drink, :name, :price, :supersized

	def initialize(m,n,p)
		@mealnum = m
		@drink = "None"
		@name = n
		@price = p
		@supersized = false
	end

	def supersize
		@price= @price * 1.5
		@supersized= true
	end

	def supersized?
		@supersized
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
		Outputter.super_size_prompt(order)

		supersizechoice = gets.strip.downcase

		if supersizechoice == 'y' || supersizechoice == 'yes' 
			order.supersize 
			puts order.inspect
			payment(order)
		elsif  supersizechoice == 'n' || supersizechoice == 'no' 
			payment(order)
		else 
			Outputter.no_command_error
		end

	end 

	def payment(order)
		Outputter.prepayment_readback(order)




	end












end