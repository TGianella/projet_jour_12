require_relative "../lib/day_trader"

describe "the buying_day method" do
  it "should return the index of the lowest number in the array" do
    expect(buying_day([3, 8, 23, 18, 1, 22])).to eq(4)
  end
end

describe "the selling_day method" do
  it "should return the index of the highest number in the array" do
    expect(selling_day([12, 2, 14, 3, 23], 1)).to eq([1, 4])
  end

  it "should return a number after the index given as a second argument" do
    expect(selling_day([99, 2, 14, 3, 23], 1)).to eq([1, 4])
  end
end

describe "the trader_day method" do
  it "should check the argument to be an array of numbers only" do
    expect(trading_day("string")).to eq("Erreur")  
    expect(trading_day(1)).to eq("Erreur")  
    expect(trading_day(1.5)).to eq("Erreur")  
    expect(trading_day(["mot", 1, 2, 3])).to eq("Erreur")  
    expect(trading_day([])).to eq("Erreur")
    expect(trading_day([[1, 2], 3, 4])).to eq("Erreur")
  end

  it "should return the highest value after the lowest value in the array" do
    expect(trading_day([34, 2, 12, 78, 3, 7])).to eq([1, 3])
  end
end    
