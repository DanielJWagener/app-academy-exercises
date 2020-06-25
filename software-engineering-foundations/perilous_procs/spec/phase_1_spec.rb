require "phase_1"

describe "some?" do
  it "returns a boolean indicating whether or not at least one of the elements of the array returns true when given to the block" do
    expect(some?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)                                #
    expect(some?([3, 4, 11, 5]) { |n| n.even? }).to eq(true)                                
    expect(some?([8, 2]) { |n| n.even? }).to eq(true)                                       
    expect(some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false) 
    expect(some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(true) 
    expect(some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }).to eq(true)        
  end
end

describe "exactly?" do
  it "returns a boolean indicating whether or not there are exactly n elements that return true when given to the block" do
    expect(exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }).to eq(true)         # true
    expect(exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }).to eq(false)         # false
    expect(exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }).to eq(true)         # true
    expect(exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }).to eq(true)  # true
    expect(exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }).to eq(false)  # false
    expect(exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }).to eq(true)  # true
    expect(exactly?([4, 5], 3) { |n| n > 0 }).to eq(false)                             # false
    expect(exactly?([4, 5, 2], 3) { |n| n > 0 }).to eq(true)                          # true
    expect(exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }).to eq(true)                # true
  end
end