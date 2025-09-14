require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  let(:calc) { described_class.new }

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
