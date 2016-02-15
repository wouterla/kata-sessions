require 'rspec'
require_relative 'fizz_buzz'

describe 'Fizz Buzz tests' do

  let(:fizzbuzz) {
    FizzBuzz.new
  }

  it 'should return 1 when 1 is passed in' do
    expect(fizzbuzz.say(1)).to eq(1)
  end

  it 'should return 2 when 2 is passed in' do
    expect(fizzbuzz.say(2)).to eq(2)
  end

  it 'should return Fizz when divisible by 3' do
    expect(fizzbuzz.say(3)).to eq('Fizz')
  end

  it 'should return Buzz when divisible by 5' do
    expect(fizzbuzz.say(5)).to eq('Buzz')
  end

  it 'should return FizzBuzz when divisible by 3 and 5' do
    expect(fizzbuzz.say(15)).to eq('FizzBuzz')
  end

end
