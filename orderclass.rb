require './outputter'

class Orders

	attr_accessor :mealnum, :drink, :name, :price, :supersized, :payment, :change

	def initialize(m,n,p)
		@mealnum = m
		@drink = "None"
		@name = n
		@price = p
		@supersized = false
		@payment = 0
		@change = 0
	end

	def supersize
		@price= @price * 1.5
		@supersized= true
	end

	def supersized?
		@supersized
	end

	def transaction
		self.payment = gets.chomp.to_f
		self.change = self.payment - self.price
	end

end

class DriveThru 

	def initialize(menu)
		@menu = menu
	end

	def start

		Outputter.welcome_message

		custinput = gets.downcase.chomp

		while custinput != 'quit'

			if custinput == 'driveup'
				choose_meal
			else 
				Outputter.no_command_error
				custinput = gets.downcase.chomp
			end
		end
		
	end

	def display_menu
		Outputter.meal_choice_prompt 
		@menu[:meals].each do |number, name_price|
			puts "#{number} - #{name_price[:name]} - #{name_price[:price]}"
		end
	end


	def choose_meal
		display_menu
		
		mealchoice = gets.chomp

		while mealchoice != 'quit'

			if @menu[:meals].has_key?(mealchoice)
				order = Orders.new(mealchoice, @menu[:meals][mealchoice][:name], @menu[:meals][mealchoice][:price])
				Outputter.meal_choice_confirm(order)
				choose_drink(order)
			else 
				Outputter.no_choice_error
				mealchoice = gets.chomp
			end
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

		while drinkchoice != 'back'

			if @menu[:drinks].include?(drinkchoice)
				order.drink = drinkchoice.capitalize
				Outputter.drink_choice_confirm(order)
				supersize(order)
			else 
				Outputter.no_choice_error
				drinkchoice = gets.chomp.downcase
			end
		end
	end

	def supersize(order)
		Outputter.super_size_prompt(order)

		supersizechoice = gets.strip.downcase

		while supersizechoice != 'back'

			if supersizechoice == 'y' || supersizechoice == 'yes' 
				order.supersize 
				payment(order)
			elsif  supersizechoice == 'n' || supersizechoice == 'no' 
				payment(order)
			else 
				Outputter.no_command_error
				supersizechoice = gets.strip.downcase
			end
		end
	end 

	def payment(order)
		Outputter.prepayment_readback(order)
		
		order.transaction

		while order.change < 0
			puts "Sorry, that's not enough.  Your total is $#{order.price}"
			order.transaction
		end
		sendoff(order)
	end

	def sendoff(order)
		puts "Ok, your change is #{order.change}.  Enjoy your #{order.name} meal and your #{order.drink}, come again soon!"
	end

end


