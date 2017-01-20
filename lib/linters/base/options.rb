module Linters
  module Base
    # Base Options class for all linters
    # @abstract
    class Options
      # Linter command that will run against a file
      # @param _filename [String] relative path to the file being checked
      # @return [String] cli command to run
      def command(_filename)
        raise NotImplementedError, error_message_for(:command)
      end

      # Filename that the linter will look for the config by default.
      # @return [String] path and filename of the config file the linter wants
      def config_filename
        raise NotImplementedError, error_message_for(:config_filename)
      end

      # Object to parse linter output, returning hash with line numbers and
      # messages of the issues
      # @return [#parse] a Tokenizer object implementing `#parse`
      def tokenizer
        raise NotImplementedError, error_message_for(:tokenizer)
      end

      # Returns content of linter's configuration file.  If the configuration
      # needs merging -- the default config needs to be combined with repo's
      # config -- then that work should happen here.
      # @param _content [String] contents of a config file
      # @return [Sring, nil] the contents of the config file or nil
      def config_content(_content)
        raise NotImplementedError, error_message_for(:config_content)
      end

      private

      def error_message_for(method)
        "implement ##{method} in your Options class"
      end
    end
  end
end