require 'helper'

describe 'MultiToml' do

  let(:tomler) do
    Object.new.tap do |o|
      o.extend MultiToml
    end
  end

  subject { tomler.load('anything') }

  describe 'toml adapter' do
    before do
      parser = Class.new
      parser.class_eval do
        def initialize(input)
        end

        def parsed
          'result'
        end
      end
      toml = Module.new
      toml.const_set :Parser, parser
      Object.const_set(:TOML, toml)
      tomler.adapter = :toml
    end
    after do
      Object.send :remove_const, :TOML
    end
    it { should == 'result' }
  end

  describe 'toml_ruby adapter' do
    before do
      Object.const_set(:Toml, double(:load => 'result'))
      tomler.adapter = :toml_ruby
    end
    after do
      Object.send :remove_const, :Toml
    end
    it { should == 'result' }
  end

  describe 'toml2 adapter' do
    before do
      Object.const_set(:TOML, double(:load => 'result'))
      tomler.adapter = :toml2
    end
    after do
      Object.send :remove_const, :TOML
    end
    it { should == 'result' }
  end

end
