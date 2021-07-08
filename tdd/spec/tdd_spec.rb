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
        arr = [-1, 0, 2, -2, 1]
        it 'find all pairs of elements that sum to 0' do
            expect(arr.two_sum).to include([0, 4], [2, 3])
        end

        it 'returns an empty array if there are no pairs that sum to 0' do
            expect([1, 2, 3, 4].two_sum).to eq([])
            expect([].two_sum).to eq([])
        end

        it 'returns a 2 dimentional array with sorted pairs' do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end
