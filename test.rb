

# in order to ask your ruby file to discover Gemfile and make all of the gems in 
#    your Gemfile available to the application you need to add three statements at the top of the ruby file.

require 'rubygems'
require 'bundler/setup'
require 'byebug'
require 'rspec'
Bundler.require(:default)

# we can also create one file in which we can just import above three lines and reuqire that file in every file
  # instead of calling these three statements again and again

# Program

=begin

Write a program which will find a pair in an array whose sum will be quivalent to 10.

Input = [3, 5, -4, 8, 11, -1, 6]

We need to find a pair of nos whose sum is equivalent to 10


First Solution: 
  => We can iterate over with loops one giving value in i and another in j
    and checking which i+j is equivalent to 10. This is very basic solution but its time complexity
    will be n*n i.e n^2 as we are using two loops here.

Second Solution:
   => Using Hash tables
    we need to find two no's whose sum is equivalent to 10
      i.e x + y = 10
              y = 10 - x 
              we will put each no i.e x in above equation if result of y = 10 - x is present in hash
              then we will break the loop as we have found our solution
              else we will put the no x in hash as key with value true.

              When the result is present in hash then we will break



=end

# [3, 5, -4, 8, 11, -1, 6]
def pair_sum_using_hash_table(input, target_sum)
  # hash which will store nos
  hash_table = {}
  
  # target sum should be 10
  #target_sum = 10

  # put both no's in array which sums up to 10
  result = []
  
  for i in input do
    tmp_result = target_sum - i
    # if tmp_result is present in hash then break , we found our nos
    if hash_table.has_key?(tmp_result)
        result << i 
        result << tmp_result
        break
    else
        # if equation result is not present in hash then put i in hash
        hash_table[i] = true
    end
  end
  ap "Out put #{result}"
  return result
end

ap pair_sum_using_hash_table(input = [3, 5, -4, 8, 11, -1, 6], target_sum = 10)

# lets test the program

# for running spec
# rspec ./programs/sum_of_pairs.rb
describe "Sum of pairs" do
    it "Should return the sum as 10" do
      expect(pair_sum_using_hash_table(input = [3, 5, -4, 8, 11, -1, 6], target_sum = 10).sum).to eq 10
    end

    it "Should return the sum as 14" do
      expect(pair_sum_using_hash_table(input = [3, 5, -4, 8, 11, -1, 6], target_sum = 14).sum).to eq 14
    end

    it "Should return the sum as 8" do
        expect(pair_sum_using_hash_table(input = [3, 5, -4, 8, 11, -1, 6], target_sum = 8).sum).to eq 8
    end
    
    it "Should return the sum as 0 as not pair is present" do
        expect(pair_sum_using_hash_table(input = [3, 5, -4, 8, 11, -1, 6], target_sum = 20).sum).to eq 0
    end
end

