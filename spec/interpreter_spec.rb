# spec/interpreter_spec.rb
require 'spec_helper'
require_relative '../lib/esolang.rb'

describe Esolang do
  it "should interpret boolfuck code correctly" do
    code = ";;;+;+;;+;+;
    +;+;+;+;;+;;+;
    ;;+;;+;+;;+;
    ;;+;;+;+;;+;
    +;;;;+;+;;+;
    ;;+;;+;+;+;;
    ;;;;;+;+;;
    +;;;+;+;;;+;
    +;;;;+;+;;+;
    ;+;+;;+;;;+;
    ;;+;;+;+;;+;
    ;;+;+;;+;;+;
    +;+;;;;+;+;;
    ;+;+;+;"
    result = described_class.boolfuck(code)
    expect(result).to eq("000100101010011000110110001101101111011000110100000001001110111011110110010011100011011000100110100001000101")
  end
end
