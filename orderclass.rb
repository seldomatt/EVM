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

end


class DriveThru 

	def initialize(menu)
		@menu = menu
		# is this initialize stupid?
	end

	def start

		Outputter.welcome_message

		custinput = gets.downcase.chomp

		while custinput != "quit"

			if custinput == 'driveup'
				choose_meal
			else 
				Outputter.no_command_error
			end
		end
	
	end

	def display_menu
		@menu[:meals].each do |number, name_price|
			puts "#{number} - #{name_price[:name]} - #{name_price[:price]}"
		end
	end


	def choose_meal

		display_menu

		puts "Which meal would you like? (type '1', '2', etc.)"

		mealchoice = gets.chomp.to_i

		if @menu[:meals].has_key?(mealchoice)
			order = Orders.new(mealchoice, @menu[:meals][mealchoice][:name], @menu[:meals][mealchoice][:price])
			puts order.inspect
			choose_drink(order)
		else 
			puts "That's not a menu choice, try again"
		end
	
	end

	def display_drinks(order)
		@menu[:drinks].each do |drink|
			puts "#{order.name} with a #{drink}?"
		end
	end


	def choose_drink(order)
		display_drinks(order)

	end


end