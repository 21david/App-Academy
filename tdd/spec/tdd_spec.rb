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

describe '#my_transpose' do
    matrix = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]

    it 'rows should equal columns' do
        expect(my_transpose(matrix)[0]).to eq([0,3,6])
        expect(my_transpose(matrix)[1]).to eq([1,4,7])
        expect(my_transpose(matrix)[2]).to eq([2,5,8])
    end

    it 'should not mutate the matrix' do
        expect(my_transpose(matrix)).to_not be(matrix)
    end

    it 'returns empty array if an empty array is passed through' do
        expect(my_transpose([])).to eq([])
    end
end

describe '#stock_picker' do
    it 'should take an array of stock prices and output the most profitable pair of days on which to buy and sell a stock' do
        array = [2, 5, 8, 1, 0, 6]
        expect(stock_picker(array)).to eq([0,2])
        array_2 = [3, 5, 8, 9, 1, 99]
        expect(stock_picker(array_2)).to eq([4,5])
    end

    it 'should return nil if array length is less than 2' do
        array_3 = [1]
        arr = []
        expect(stock_picker(array_3)).to eq(nil)
        expect(stock_picker(arr)).to eq(nil)
    end

end

describe TowersOfHanoi do
    describe
