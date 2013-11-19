require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class BasicSortedSet
  # Create your internal data structure here. It should be an empty array
  def initialize
    @ary = []
  end

  # Use the array's native insert method
  def insert(element)
    if @ary.include? element
      return false
    else
      @ary << element
      return element
    end
  end

  # Use the array's native include method
  def include?(element)
    @ary.include? element
  end

  # Use the array's native sort method
  def get_sorted_array
    @ary.sort
  end
end

class TestSortedSet
  def initialize(set_type)
    @test_set_type = set_type
    @set_type = BasicSortedSet
  end

  def test
    puts "="*10
    puts "Testing #{@test_set_type.new.name}"
    puts "="*10
    test_insert_include
  end

  def test_insert_include
    test_set = @test_set_type.new
    set = @set_type.new

    100.times do |x|
      decision = (rand * 100).to_i
      if decision % 2 == 0
        a = test_set.insert(x)
        b = set.insert(x)
        assert a == b, "Inserting #{x} failed: \nGot: #{a}\nExpected: #{b}"
      end
    end

    puts "Inserting once works!"

    100.times do |x|
      decision = (rand * 100).to_i % 2
      if decision
        a = test_set.insert(x)
        b = set.insert(x)
        assert a == b, "Inserting #{x} a second time failed: \nGot: #{a}\nExpected: #{b}"
      end
    end
    
    puts "Inserting twice works properly!"

    100.times do |x|
      assert test_set.include?(x) == set.include?(x), "Include? for #{x} gives wrong result"
    end
    
    puts "Inclusion works properly!"

    test_set = @test_set_type.new
    set = @set_type.new

    100.times do
      x = (rand * 1000).to_i
      set.insert x
      test_set.insert x
    end

    assert test_set.get_sorted_array == set.get_sorted_array, "Sorting the array failed. Here is the array #{test_set.get_sorted_array}"

    puts "Sorting works properly!"
  end
end

require_relative 'sorted_set.rb'
TestSortedSet.new(BasicArraySortedSet).test
TestSortedSet.new(HashSortedSet).test
TestSortedSet.new(ArraySortedSet).test
TestSortedSet.new(BinaryArraySortedSet).test
