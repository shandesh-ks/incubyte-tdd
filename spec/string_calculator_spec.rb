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
  end

end
