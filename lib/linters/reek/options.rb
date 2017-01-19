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
        config(content).to_yaml
      end

      private

      def config(content)
        Config.new(content: content, default_config_path: "config/reek")
      end
    end
  end
end
