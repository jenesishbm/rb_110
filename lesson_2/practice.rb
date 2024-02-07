# 1. How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# 2. How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash[:published].to_i # with or without to_i is okay
end
# 3. For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][-1] # -1 index is last
arr2[1][:third][0]
arr3[-1][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0) # returns key for given value