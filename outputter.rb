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

	def self.super_size_prompt(order)
		puts "Do you want to supersize your #{order.name} meal? (Y/N)"
	end

	def self.prepayment_readback(order)
		if order.supersized?
			puts "Ok, that's one supersized #{order.name} meal with a #{order.drink}.  You're total is #{order.price}"
		else 
			puts "Ok, that's one #{order.name} meal with a #{order.drink}.  You're total is #{order.price}"
		end
	end

end