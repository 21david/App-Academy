require 'tdd'
require 'rspec'

describe "#my_uniq" do
    it 'should return unique elements in the order they apear' do
        arr = [1, 2, 1, 3, 3]
        expect(my_uniq(arr)).to eq([1,2,3])
    end
    
    it 'should return a new array' do
        arr = [1, 2, 1, 3, 3]
        expect(my_uniq(arr)).to_not be(arr)
    end
end

describe Array do 
    describe '#two_sum' do
        it 'find all pairs of elements that sum to 0' do

        end

        it 'returns an empty array if there are no pairs that sum to 0' do

        end

        it 'returns a 2 dimentional array with sorted pairs' do

        end
    end
end
