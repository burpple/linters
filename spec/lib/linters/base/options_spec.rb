require "linters/base/options"

RSpec.describe Linters::Base::Options do
  describe "#command" do
    it "raises a NotImplementedError" do
      options = Class.new(Linters::Base::Options).new

      expect { options.command("a.rb") }.to raise_exception(NotImplementedError)
    end
  end
end
