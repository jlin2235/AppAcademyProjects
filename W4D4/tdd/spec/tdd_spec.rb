require 'tdd'

describe "my_uniq" do
    it 'should accept an array as an argument' do 
        expect{my_uniq(['a','b','c'])}.to_not raise_error
        # expect{my_uniq([1,2,3])}.to_not raise_error
    end

    it "should return unique elements in it's original order" do
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end
end
describe "two_sum" do
    it 'should accept an array as an argument' do 
        expect{two_sum([1,2,3,-4,-2,-1])}.to_not raise_error
    end

    it "returns all pairs of element that equals zero when added together" do
        expect(two_sum([1,2,3,-4,-2,-1,1])).to eq([[0,5],[1,4],[5,6]])
    end
end

describe 'my_transpose' do
    rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    it "should accept an array as arguments" do
        expect{my_transpose(rows)}.to_not raise_error
    end
    it 'should transpose the array' do
        expect(my_transpose(rows)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
    
end


describe "stock_picker" do 
    stocks = [5,7,2,9,3]

     it "should accept an array as arguments" do
        expect{stock_picker(stocks)}.to_not raise_error
    end

    it "should return the pair of days on which renders the max profit to first buy and then sell" do
        expect(stock_picker(stocks)).to eq ([2,3])
    end

end




