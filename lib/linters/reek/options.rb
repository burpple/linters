require "linters/reek/tokenizer"

module Linters
  module Reek
    class Options
      def command(filename)
        "reek --no-wiki-links --single-line --no-progress #{filename}"
      end

      def config_filename
        ".reek"
      end

      def tokenizer
        Tokenizer.new
      end

      def config_content(content)
        content
      end
    end
  end
end
