module MultiToml

  PARSER_MAP = {
    :toml      => lambda { |toml| TOML::Parser.new(toml).parsed },
    :toml_ruby => lambda { |toml| Toml.load(toml) },
    :toml2     => lambda { |toml| TOML.load(toml) }
  }

  class NoParserError < RuntimeError
    def initialize(adapter)
      super(adapter.nil? ? 'Could not detect a TOML parser' : "No TOML parser for #{adapter}")
    end
  end

  def load(input)
    parser.call(input)
  end

  def adapter
    return @adapter if defined?(@adapter)
    @adapter = detect_adapter
  end

  def adapter=(adapter)
    @adapter = adapter
  end

  def detect_adapter
    begin
      require 'toml'
      TOML.respond_to?(:load) ? :toml2 : :toml
    rescue LoadError
      begin
        require 'toml-ruby'
        :toml_ruby
      rescue LoadError
        nil
      end
    end
  end

  def parser
    PARSER_MAP[adapter] or raise NoParserError.new(adapter)
  end

  extend self

  class << self
    private :detect_adapter, :parser
  end

end
