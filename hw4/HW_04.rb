###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################


# Create array of number choices

set_of_numbers = (1..10).to_a

# Select a random number

secret_number = set_of_numbers.sample


messages = { :win => "Congratulations.  You won!", 
	:lose => "Sorry, you lost.  The secret number was #{secret_number}.",
	:too_low => "Your guess was too low. Please guess a higher number.",
	:too_high => "Your guess was too high. Please guess a lower number."}

puts "\nWelcome to the Secret Number Game!"

puts "This game was created by Julie Roche"

puts "\nPlease enter your name"

player_name = $stdin.gets.chomp

puts "\nHi #{player_name}!"

puts "You have three tries to guess the secret number between 1 and 10.  Please enter you first guess."

# Create method to increase count

def increment_guess_count (integer)
	integer += 1
end

#  Create method to tell how many guesses left

def guesses_left (number)
	remaining_guesses = 3 - number
	puts "Sorry, that is not the secret number.  You now have #{remaining_guesses} guesses left."
end

# Create method to give hint if guess is wrong

def give_hint (guess_number, sec_number)
	if guess_number > sec_number
		#puts messages[:too_high] -  THIS GIVES ME AN ERROR BUT I DON'T KNOW WHY
		puts "Your guess was too high. Please guess a lower number."
	else  
		#puts messages[:too_low] - THIS GIVES ERROR TOO
		puts "Your guess was too low. Please guess a higher number."
	end
end

guessed = 0
remaining_guesses = 3


#  Ask for guess and reply - repeat 3 times or break if correct number

while guessed < 3

  guess = $stdin.gets.chomp.to_i

  guessed = increment_guess_count(guessed)

  if guess == secret_number
	puts messages[:win]
	exit
	
  elsif guessed!= 3 #if more guesses left, tell how many and gve hint

	guesses_left(guessed)

	give_hint(guess, secret_number)

  else	#  if players last guess was not correct and they have no guesses left, they lose			
	puts messages[:lose]
  end

end
