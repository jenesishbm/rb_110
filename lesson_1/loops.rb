# LOOP 1

# 1.
loop do
  puts 'Just keep printing...'
  break
end

# 2.
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

# 3.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# 4.
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == "yes"
end

# 5.
say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter > 5
end

# 6.
numbers = []

while numbers.length < 5 # the last time the loop should iterate is when there are 4 elements in the array (to generate the final element) 
  numbers << rand(100)
end

puts numbers

# 7.
count = 1

until count > 10
  puts count
  count += 1
end


# 8.
numbers = [7, 9, 13, 25, 18]
counter = 0

until counter == numbers.size
  puts numbers[counter]
  counter += 1
end

# 9.
for i in 1..100
  puts i if i.odd?
end

# 10.
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for i in friends
  puts "Hello, #{i}!"
end

# LOOP 2

# 1.
count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end

  count += 1
  break if count > 5
end

# 2.
loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end

# 3.
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasn't processed!"
end

# 4.
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else 
    puts "Wrong answer. Try again!"
  end
end

# 5.
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end

puts numbers

# 6. firs to last
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# last to first
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end

# 7.
5.times do |index|
  puts index
  break if index == 2
end

# 8
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# 9***
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a == 5 || number_b == 5 # re-starts loop unless 5 is reached

  puts "5 was reached!"
  break 
end

# 10
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end