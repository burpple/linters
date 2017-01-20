require "linters/tokenizer"
require "linters/reek/tokenizer"

describe Linters::Reek::Tokenizer do
  describe "#parse" do
    it "parses line numbers when columns provided" do
      tokenizer = Linters::Reek::Tokenizer.new

      parsed = tokenizer.parse <<~OUTPUT
        test.rb:9: IrresponsibleModule: LintersHelper has no descriptive comment
      OUTPUT

      expected_message = "IrresponsibleModule: LintersHelper has no descriptive comment"

      expect(parsed).to eq([{ line: 9, message: expected_message }])
    end
  end
end
