REPS = 100
COUNT = 10000

class SortedSetTest
  def self.run_tests(sets)
    @@results = {}
    sets.each do |set|
      @@results[set.name] = test_set(set)
    end
  end

  def self.test_set(set)
    SpeedTest.test(SetTester.new(set))
  end

  def self.print_all
    print_results(:sort)
    print_results(:include)
    print_results(:insert)
  end

  def self.print_results(method)
    puts "#{method} results"
    puts "=============="
    print_col "Set Size"
    @@results.keys.each do |set_key|
      print_col @@results[set_key][:name]
    end
    print "\n"

    10.times do |i|
      print_col (i+1)*COUNT/10
      @@results.keys.each do |set_key|
        print_col @@results[set_key][method][i]
      end
      print "\n"
    end
  end

  def self.print_col(input)
        print "#{input.to_s.ljust(10).slice(0,10)}\t"
  end

end

class SetTester
  def initialize(set)
    @set = set
  end

  def name
    @set.name
  end

  def init(size, reps)
    @reps = reps
    size.times do |x|
      @set.insert "test #{x}abcdefghijklmnopzz".split('').shuffle.join('')
    end
  end

  def call_sort
    @reps.times do
      @set.get_sorted_array
    end
  end

  def call_insert
    @reps.times do |x|
      @set.insert "abcdefghijklmnopqrstuvwxyz#{x}".split('').shuffle.join('')
    end
  end

  def call_include
    @reps.times do
      @set.include? "abc"
    end
  end
end

class SpeedTest
  @@reps = REPS
  def self.test(subject, count=COUNT)
    results = {
      include: [],
      sort: [],
      insert: []
    }
    results[:name] = subject.name
    10.times do |fraction|
      size = count * (fraction + 1) / 10
      subject.init(size, @@reps)

      start = Time.now
      subject.call_include
      finish = Time.now
      results[:include] << (finish - start)

      start = Time.now
      subject.call_sort
      finish = Time.now
      results[:sort] << (finish - start)

      start = Time.now
      subject.call_insert
      finish = Time.now
      results[:insert] << (finish - start)
    end
    return results
  end
end

require_relative 'sorted_set'

SortedSetTest.run_tests([BasicArraySortedSet.new, ArraySortedSet.new, HashSortedSet.new])
SortedSetTest.print_all
