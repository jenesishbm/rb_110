# 1. What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

=begin
ME: The return value of invoking the select method on [1, 2, 3] is [1, 2, 3]. 
This is because select iterates through the array and executes the block, adding each element for which 
the block evaluates as true to a new array, then returns this new array. Since the last line
of code in the block is 'hi', and 'hi' is always truthy, each element will be returned.

LS: select performs selection based on the truthiness of the block's return value. 
In this case the return value will always be 'hi', which is a "truthy" value. Therefore select will return a new array containing all of the elements in the original array.
=end

# 2. How does count treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

=begin
ME: The count method will iterate through each element and execute the block. If the return value of the
block is truthy, count will count it, incrementing its own return value by 1. In this case, invoking count will return
2. We can find out by consulting the Ruby docs for Array#count.

LS: Based on the Ruby docs, we can conclude that count only counts an element if the block's return value evaluates as true. 
This means that count considers the truthiness of the block's return value.
=end

# 3. What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end
=begin
ME: According to the Ruby docs, the reject method returns a new array whose elements are all those from 
the calling array for which the block returns false or nil. Based on this definition, the return value of the
above code will be [1,2,3] since puts always returns nil.

LS: Since puts always returns nil, you might think that no values would be selected and an empty array would be returned. 
The important thing to be aware of here is how reject treats the return value of the block. reject returns a new array containing items 
where the block's return value is "falsy". In other words, if the return value was false or nil the element would be selected.
=end

# 4. What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
=begin
ME: { a: 'ant', b: 'bear', c: 'cat'}

LS: { "a" => "ant", "b" => "bear", "c" => "cat" }
When we invoke each_with_object, we pass in an object ({} here) as an argument. 
This object is then available inside the block, such that it can be mutated. 
Once each_with_object has iterated over the calling collection, it returns the initially given object, 
which now contains all of the updates.

In this code, we start with the hash object, {}. On the first iteration, we add "a" => "ant" to the hash. 
On the second, we add "b" => "bear", and on the last iteration, we add "c" => "cat". Thus, #each_with_object in this example returns a hash with those 3 elements.


=end

# 5. What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift

=begin
LS: 
shift destructively removes the first key-value pair in hash and returns it as a two-item array. 
If we didn't already know how shift worked, we could easily learn by checking the docs for Hash#shift. 
The description for this method confirms our understanding:
  -Removes a key-value pair from hsh and returns it as the two-item array [ key, value ], or nil if the hash is empty.
=end

# 6. What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

=begin
ME: The code will return 11. Since we are method chaining, calling pop will return 'caterpillar' and calling size 
on 'caterpillar' will return 11 since there are 11 characters.
=end

# 7. What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
LS:
The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is num.odd?, which returns a boolean. 
Therefore the block's return value will be a boolean, since Integer#odd? can only return true or false.
Since the Array#any? method returns true if the block ever returns a value other than false or nil, and the block returns true on the first iteration, we know that any? will return true. 
What is also interesting here is any? stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, puts num is only ever invoked for the first item in the array: 1.
=end

# 8. How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)

=begin
Based on the Ruby docs, take is a non-mutating method that returns a new Array containing the first n element of self, where n is a non-negative integer.

With this in mind, we expect take(2) to return [1, 2] since these are the first 2 elements in arr.
=end

# 9. What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

=begin
map always returns an array. In this case, the if condition evaluates as false in the first iteration ('ant') which 
returns nil. In the second iteration ('bear'), the if statement evaluates true and returns 'bear'.

In other words, this code will return => [nil, "bear"]
=end

# 10.
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
For the first element, the if condition evaluates as false, which means num is the block's return value for that iteration. 
For the rest of the elements in the array, num > 1 evaluates as true, which means puts num is the last statement evaluated, 
which in turn, means that the block's return value is nil for those iterations.

Therefore, the return value of map will be => [1, nil, nil]
=end

