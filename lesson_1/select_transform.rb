# Coding along Selection and Transformation section

# 1. Select the key-value pairs where the value is 'Fruit'

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

=begin 
-Input = hash, output = Hash

-Iterate through all hash keys and check if the value associated with it in the hash == Fruit
  -If so, add to new hash. If not, do nothing.
    -need counter variable, keys array, and new hash to ouput
Return new hash
=end

# keys = ["apple", "carrot", "pear", "broccoli"]
def select_fruit(hash)
  keys = hash.keys
  counter = 0
  fruits = {}

  loop do
    if hash[keys[counter]] == "Fruit"
      fruits[keys[counter]] = "Fruit"
    end
    counter += 1
    break if counter == keys.size
  end
  p fruits
end

select_fruit(produce)

# 2. Write a mutating method that doubles each number in an array

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  counter = 0

  loop do
    numbers[counter] *= 2 # indexed assignment is mutating for arrays, hashes, strings
    counter += 1
    break if counter == numbers.size
  end
  numbers
end

double_numbers!(my_numbers)
my_numbers

# 3. Write a solution that doubles the numbers that have odd indices

def double_odd_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_index(my_numbers) # => [1, 8, 3, 14, 2, 12]

# 4. Write a method that allows you to multiply every array item by a specified value
def multiply(array, number)
  counter = 0
  products = []

  loop do
    break if counter == array.size
    current_number = array[counter]
    products << current_number * number
    counter +=1
  end

  products
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]