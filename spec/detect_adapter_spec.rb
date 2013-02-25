require 'helper'

describe 'MultiToml.detect_adapter' do

  let(:tomler) do
    Object.new.tap do |o|
      o.extend MultiToml
    end
  end

  subject { tomler.adapter }

  describe 'when no adapter is available' do
    before { tomler.stub(:require).and_raise(LoadError) }
    it { should == nil }
  end

  # TODO: I would like to change these tests to actually load the libraries
  #       and then unload them after each run. I tried this four different
  #       ways and then gave up. Right now, they're pretty brittle tests.

  describe 'when toml is available' do
    before do
      tomler.stub(:require).with('toml')
      tomler.stub(:require).with('toml-ruby').and_raise(LoadError)
      Object.const_set(:TOML, Object.new)
    end
    after do
      Object.send :remove_const, :TOML
    end
    it { should == :toml }
  end

  describe 'when toml-ruby is available' do
    before do
      tomler.stub(:require).with('toml').and_raise(LoadError)
      tomler.stub(:require).with('toml-ruby')
    end
    it { should == :toml_ruby }
  end

  describe 'when toml-ruby is available' do
    before do
      tomler.stub(:require).with('toml')
      tomler.stub(:require).with('toml-ruby').and_raise(LoadError)
      Object.const_set(:TOML, double(:load => ''))
    end
    after do
      Object.send :remove_const, :TOML
    end
    it { should == :toml2 }
  end

end
