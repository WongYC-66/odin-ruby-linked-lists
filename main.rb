require_relative 'linked_list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')


puts list  # ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil.


# ChatGPT Test cases
puts "###############"

list = LinkedList.new

# Test 1: Append and check size, head, and tail
puts "--- Test 1 ---"
list.append(10)
puts list.size == 1               # Expected: true
puts list.head.value == 10         # Expected: true
puts list.tail.value == 10         # Expected: true

list.append(20)
puts list.size == 2               # Expected: true
puts list.tail.value == 20         # Expected: true

# Test 2: Prepend and check head and size
puts "--- Test 2 ---"
list.prepend(5)
puts list.size == 3               # Expected: true
puts list.head.value == 5          # Expected: true

# Test 3: 'at' method for different indices
puts "--- Test 3 ---"
puts list.at(0) == 5              # Expected: true
puts list.at(1) == 10             # Expected: true
puts list.at(2) == 20             # Expected: true
puts list.at(3).nil?              # Expected: true (out-of-bounds index)

# Test 4: Pop method
puts "--- Test 4 ---"
list.pop
puts list.size == 2               # Expected: true
puts list.tail.value == 10         # Expected: true

list.pop
puts list.size == 1               # Expected: true
puts list.tail.value == 5          # Expected: true

# Test 5: Pop when only one element
puts "--- Test 5 ---"
list.pop
puts list.size == 0               # Expected: true
puts list.head.nil?               # Expected: true
puts list.tail.nil?               # Expected: true

# Test 6: contains? method
puts "--- Test 6 ---"
list.append(15)
list.append(25)
puts list.contains?(15) == true   # Expected: true
puts list.contains?(30) == false  # Expected: false

# Test 7: find method
puts "--- Test 7 ---"
puts list.find(15) == 0           # Expected: true (15 at index 0)
puts list.find(25) == 1           # Expected: true (25 at index 1)
puts list.find(35).nil?           # Expected: true (value not in list)

# Test 8: insert_at method
puts "--- Test 8 ---"
list.insert_at(35, 1)
puts list.size == 3               # Expected: true
puts list.at(1) == 35             # Expected: true
puts list.at(2) == 25             # Expected: true

# Test 9: remove_at method
puts "--- Test 9 ---"
list.remove_at(1)
puts list.size == 2               # Expected: true
puts list.at(1) == 25             # Expected: true
puts list.at(0) == 15             # Expected: true

# Test 10: remove_at first and last node
puts "--- Test 10 ---"
list.remove_at(0)
puts list.size == 1               # Expected: true
puts list.at(0) == 25             # Expected: true

list.remove_at(0)
puts list.size == 0               # Expected: true
puts list.head.nil?               # Expected: true

# Test 11: String representation (to_s)
puts "--- Test 11 ---"
list.append(5)
list.append(10)
list.append(15)
puts list.to_s == "( 5 ) -> ( 10 ) -> ( 15 ) -> nil"  # Expected: true
