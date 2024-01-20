# spec/interpreter_spec.rb
require 'spec_helper'
require_relative '../lib/interpreters/boolfuck_interpreter.rb'

describe Esolang::Interpreters::Boolfuck do
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
    interpreter = described_class.new(code)
    result = interpreter.run
    expect(result).to eq("000100101010011000110110001101101111011000110100000001001110111011110110010011100011011000100110100001000101")
  end
end
