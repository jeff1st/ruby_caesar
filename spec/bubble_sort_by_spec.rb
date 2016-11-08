require_relative '../bubble_sort_by'

describe '#bubble_sort_by' do
  it 'must accept an array' do
    x = "string"
    y = 123
    z = { a: 1, b: 2 }
    a = true
    expect(bubble_sort_by(x)).to eq(false)
    expect(bubble_sort_by(y)).to eq(false)
    expect(bubble_sort_by(z)).to eq(false)
    expect(bubble_sort_by(a)).to eq(false)
  end
end

describe '#bubble_sort_by' do
  it 'must return an array' do
    expect(bubble_sort_by(["he", "llo"])).to be_a(Array)
  end
end

describe '#bubble_sort_by' do
  it 'must return an array of the same length' do
    x = ["this", "is", "an", "array", "for", "testing", "length"]
    y = bubble_sort_by(x) do |left, right|
      left.length - right.length
    end
    expect(y.length).to eq(x.length)
  end
end

describe '#bubble_sort_by' do
  it 'must return a sorted array' do
    x = ["this", "is", "an", "array", "for", "testing", "length"]
    y = bubble_sort_by(x) do |left, right|
      left.length - right.length
    end
    0.upto(x.length-2) do |i|
      expect(y[i].length - y[i+1].length).to be <= 0
    end
  end
end

