# Loop 1

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