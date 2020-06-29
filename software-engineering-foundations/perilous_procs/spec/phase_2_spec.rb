require "phase_2"

describe "xnor_select" do
  let(:is_even) { Proc.new { |n| n % 2 == 0 } }
  let(:is_odd) { Proc.new { |n| n % 2 != 0 } }
  let(:is_positive) { Proc.new { |n| n > 0 } }

  it "returns a new array containing elements of the original array that either return true for both procs or return false for both procs" do
    expect(xnor_select([8, 3, -4, -5], is_even, is_positive)).to eq([8, -5])         
    expect(xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)).to eq([-7, -13, 12])  
    expect(xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)).to eq([5, -10])
  end
end

describe "filter_out!" do
    let(:arr_1) { [10, 6, 3, 2, 5] }
    let(:arr_2) { [1, 7, 3, 5] }
    let(:arr_3) { [10, 6, 3, 2, 5] }
    let(:arr_4) { [1, 7, 3, 5] }

  it "removes elements of the input array that return true when given to the block" do
    
    filter_out!(arr_1) { |x| x.odd? }
    filter_out!(arr_2) { |x| x.odd? }
    filter_out!(arr_3) { |x| x.even? }
    filter_out!(arr_4) { |x| x.even? }

    expect(arr_1).to eq([10, 6, 2])
    expect(arr_2).to eq([])
    expect(arr_3).to eq([3, 5])
    expect(arr_4).to eq([1, 7, 3, 5])
  end
end

describe "multi_map" do
  it "returns a new array where each element of the original array is repeatedly run through the block n times" do 
    expect(multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}).to eq(["pretty!", "cool!", "huh?!"])      
    expect(multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}).to eq(["pretty!", "cool!", "huh?!"])   
    expect(multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}).to eq(["pretty!!!", "cool!!!", "huh?!!!"])   
    expect(multi_map([4, 3, 2, 7], 1) { |num| num * 10 }).to eq([40, 30, 20, 70])             
    expect(multi_map([4, 3, 2, 7], 2) { |num| num * 10 }).to eq([400, 300, 200, 700])             
    expect(multi_map([4, 3, 2, 7], 4) { |num| num * 10 }).to eq([40000, 30000, 20000, 70000])
  end
end             