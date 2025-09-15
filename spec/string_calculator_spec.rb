require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  let(:calc) { described_class.new }

  context "positive numbers" do
    it "returns 0 for an empty string" do
      expect(calc.add("")).to eq 0
    end

    it "returns the number when input is a single number" do
      expect(calc.add("1")).to eq 1
      expect(calc.add("33")).to eq 33
    end

    it "sums two comma separated numbers" do
      expect(calc.add("1,5")).to eq 6
      expect(calc.add("10,20")).to eq 30
      expect(calc.add("1,17")).to eq 18
    end

    it "sums 'n' number of input numbers" do
      expect(calc.add("3,2,1,1")).to eq 7
      expect(calc.add("5,8,34,25,5")).to eq 77
    end

    it "allows newlines between numbers" do
      expect(calc.add("1\n2,3")).to eq 6
      expect(calc.add("75\n5,29")).to eq 109
      expect(calc.add("4\n5\n1")).to eq 10
      expect(calc.add("10\n")).to eq 10
    end

    it "supports custom delimiter" do
      expect(calc.add("//;\n11;2")).to eq 13
      expect(calc.add("//|\n2|3|4")).to eq 9
      expect(calc.add("//(\n27(3(4")).to eq 34
    end
  end

  context "negative numbers" do
    it "raises an exception for one negative" do
      expect { calc.add("-1") }.to raise_error(ArgumentError, "negative numbers not allowed -1")
    end

    it "raises an exception for multiple negatives" do
      expect { calc.add("2,-4,3,-5") }.to raise_error(ArgumentError, "negative numbers not allowed -4,-5")
      expect { calc.add("2\n-7,3,-23") }.to raise_error(ArgumentError, "negative numbers not allowed -7,-23")
      expect { calc.add("//;\n-67;-35") }.to raise_error(ArgumentError, "negative numbers not allowed -67,-35")
    end
  end

  context "ignores numbers bigger than 1000" do
    it "ignores numbers greater than 1000" do
      expect(calc.add("2,1001")).to eq 2
      expect(calc.add("1234,5,6")).to eq 11
    end

    it "includes 1000 but ignores 1001" do
      expect(calc.add("1000,2")).to eq 1002
    end
  end

  context "supports long custom delimiters" do
    it "handles delimiter of any length using brackets" do
      expect(calc.add("//[***&]\n1***&2***&3")).to eq 6
      expect(calc.add("//[abc]\n10abc20abc30")).to eq 60
    end

    it "still supports old single-char delimiter without brackets" do
      expect(calc.add("//;\n11;2")).to eq 13
      expect(calc.add("//|\n2|3|4")).to eq 9
    end
  end

  context "supports multiple delimiters" do
    it "handles multiple single-char delimiters" do
      expect(calc.add("//[*][%]\n1*2%3")).to eq 6
      expect(calc.add("//[;][:]\n4;5:6")).to eq 15
    end
  end

end
