###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
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

puts "You have three tries to guess the secret number between 1 and 10."

guesses_left = 3

puts "Please enter your first guess."

#  Ask for guess and reply - repeat 3 times or break if correct number

while guesses_left > 0

  guess = $stdin.gets.chomp.to_i

  guesses_left -= 1

  if guess == secret_number
	puts messages[:win]
	break

  elsif guesses_left != 0 #if more guesses left, tell how many and if too high or too low

	puts "Sorry, that is not the secret number.  You now have #{guesses_left} guesses left."

	if guess > secret_number
		puts messages[:too_high]

	else  
		puts puts messages[:too_low]
	end

  else	#  if players last guess was not correct and they have no guesses left, they lose			
	puts messages[:lose]
  end

end
