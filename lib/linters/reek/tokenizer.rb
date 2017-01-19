module Linters
  module Reek
    class Tokenizer
      VIOLATION_REGEX = /\A
        (?<path>.+):
        (?<line_number>\d+):\s
        (?<message>.+: .+)
        \n?
      \z/x

      def parse(text)
        text.split("\n").map { |line| tokenize(line) }.compact
      end

      private

      def tokenize(line)
        matches = VIOLATION_REGEX.match(line)

        if matches
          line_number = matches[:line_number].to_i
          {
            line: line_number,
            message: matches[:message],
          }
        end
      end
    end
  end
end
