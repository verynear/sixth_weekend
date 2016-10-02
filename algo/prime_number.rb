# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.

require 'rspec'

class PrimeCheck

	def is_prime?(number)
		limit = Math.sqrt(number).to_i
		if number <= 1
			return false
		end
		limit.downto(2).each do |x|
			return false if number % x == 0
		end
		return true
	end

# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the 
# highest prime number under 10 is 7.

	def highest_prime_number_under(number)
		primes = []
		2.upto(number).each do |x|
			if is_prime?(x) && x < number
				primes << x
			end
		end
		primes.max
	end


RSpec.describe PrimeCheck do
	let(:primecheck) { PrimeCheck.new }

	describe '#is_prime?' do
		it "should return false if given 0" do
			expect(primecheck.is_prime?(0)).to be false
		end

		it "should return false if given 1" do
			expect(primecheck.is_prime?(1)).to be false
		end

		it "should return false if given 2" do
			expect(primecheck.is_prime?(2)).to be true
		end

		it "should return true if given 3" do
			expect(primecheck.is_prime?(3)).to be true
		end

		it "should return false if given 4" do
			expect(primecheck.is_prime?(4)).to be false
		end

		it "should return true if given 5" do
			expect(primecheck.is_prime?(5)).to be true
		end

		it "should return false if given 6" do
			expect(primecheck.is_prime?(6)).to be false
		end

		it "should return true if given 7" do
			expect(primecheck.is_prime?(7)).to be true
		end
	end

	describe '#highest_prime_number_under'
		it "should return 7 if given 10" do
			expect(primecheck.highest_prime_number_under(10)).to eq(7)
		end

		it "should return 7 if given 9" do
			expect(primecheck.highest_prime_number_under(9)).to eq(7)
		end

		it "should return 7 if given 8" do
			expect(primecheck.highest_prime_number_under(8)).to eq(7)
		end

		it "should return 5 if given 7" do
			expect(primecheck.highest_prime_number_under(7)).to eq(5)
		end

		it "should return 5 if given 6" do
			expect(primecheck.highest_prime_number_under(6)).to eq(5)
		end

		it "should return 3 if given 5" do
			expect(primecheck.highest_prime_number_under(5)).to eq(3)
		end

		it "should return 3 if given 4" do
			expect(primecheck.highest_prime_number_under(4)).to eq(3)
		end

		it "should return 2 if given 3" do
			expect(primecheck.highest_prime_number_under(3)).to eq(2)
		end
	end
end