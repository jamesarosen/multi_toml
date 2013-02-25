require 'helper'

describe 'MultiToml, when no adapter is loaded' do

  describe '' do
    let(:tomler) do
      Object.new.tap do |o|
        o.extend MultiToml
        o.stub(:detect_adapter).and_return(nil)
      end
    end

    subject { tomler.load('foo = bar') }

    it 'raises an error' do
      expect { subject }.to raise_error(MultiToml::NoParserError)
    end
  end

end
