require_relative '../bubble'

describe '#bubble_sort' do
  it 'takes an array of numbers and return an array of numbers' do
    x = [1, 2]
    expect(bubble_sort(x)).to be_truthy
    expect(bubble_sort(x)).to be_a(Array)
  end
end

describe '#bubble_sort' do
  it 'should return an array of the same length' do
    x = [2, 3, 5]
    expect(bubble_sort(x).length).to eq(x.length)
  end
end

describe '#bubble_sort' do
  it 'should return an array with the same elements' do
    x = [3, 2, 1]
    expect(x.all? { |num| bubble_sort(x).include?(num) }).to be(true)
  end
end

describe '#bubble_sort' do
  it 'have to return an ordered array' do
    x = [2, 4, 5, 3, 1]
    0.upto(x.length-2) do |i|
      expect(bubble_sort(x)[i] <= bubble_sort(x)[i+1]).to be(true)
    end
  end
end

