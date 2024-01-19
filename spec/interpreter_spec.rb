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
    expect(result).to eq("Hello, world!\n")
  end
end
