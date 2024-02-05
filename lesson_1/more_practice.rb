# 1. Turn this array into a hash where the names are the keys and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}

flintstones.each_with_index do |key, index|
  hash[key] = index
end

# 2. Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0

ages.each { |key, value| total_age += value }

total_age

# OR

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0

ages.values.each do |num|
  total_age += num
end

# 3. In the ages hash, remove people with age 100 and greater:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |key, value| value < 100 }

# OR LS:
ages.keep_if { |_, age| age < 100 }

# 4. Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# 5. Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name.start_with?("Be") }

# 6. Write code that changes the array below so that all of the names are shortened to just the first three characters. Do not create a new array.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name = name[0, 3] } # name[0,3] is sufficient

flintstones

# *7. Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

letter_hash = {}

statement.chars.each do |letter|
  letter_hash[letter] = statement.chars.count(letter)
end

# LS:

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8. What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
When we modify an array while we are iterating over it, we mutate the object in place. All variables referencing the calling array will point to the updated array.
The above code would output 1 and 3 since shift mutates the calling array, thus each iteration impacts subsequent iterations.

The key point is that each keeps track of its own internal index, and when you modify the array size within the loop using shift, it can lead to unexpected behavior. 
In the second iteration, each proceeds to the next index (which is now 1) and prints the corresponding element (3). The modification of the array during iteration affects which elements are processed by each.
=end

# 9. Write your own version of the rails titleize implementation.
words = "the flintstones rock"

def titleize(string)
  array = string.split
  array.each { |word| word[0] = word[0].upcase }
  array.join(" ") # joins each element with a space between
end

titleize(words)

# OR LS

words.split.map { |word| word.capitalize }.join(' ')

# 10. Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior).

KID_RANGE = (0..17)
ADULT_RANGE = (18..64)
SENIOR_RANGE = (65..1000)

munsters.each_value do |hash|
  if KID_RANGE.include?(hash["age"])
    hash["age_group"] = "kid"
  elsif ADULT_RANGE.include?(hash["age"])
    hash["age_group"] = "adult"
  else SENIOR_RANGE.include?(hash["age"])
    hash["age_group"] = "senior"
  end
end
