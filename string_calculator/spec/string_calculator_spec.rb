require File.join( File.dirname( __FILE__ ), './../lib/string_calculator' )

Spec::Matchers.define :add_to do |number|
  match do|string|
    string.extend( StringCalculator ).add.should == number
  end
end

describe StringCalculator, '#add' do
  it "returns 0 for empty string" do
    "".should add_to 0 
  end

  context "single number" do
    it "returns 4 for 4" do
      "4".should add_to 4
    end

    it "returns 22 for 22" do
      "22".should add_to 22
    end
  end

  context "two numbers" do
    it "returns 23 for 12,11" do
      "12,11".should add_to 23
    end

    it "returns 232 for 41,191" do
      "41,191".should add_to 232
    end
  end


  context "three numbers" do
    it "returns 27 for 8,9,10" do
      "8,9,10".should add_to 27
    end
    it "returns 1074 for 100,925,49" do
      "100,925,49".should add_to 1074 
    end
  end

  it "should allow newlines as delimiters" do
    "23\n11".should add_to 34
  end

  it "should allow use of mixed delimiters" do
    "23\n19,287".should add_to 329
  end

  it "should allow alternate delimiters" do
    "//;23;12".should add_to 35
  end

  context "negative numbers" do 
    it "throw an exception if finds one" do
      lambda{"-23,11".extend( StringCalculator ).add}.should raise_error
    end
  end

end
