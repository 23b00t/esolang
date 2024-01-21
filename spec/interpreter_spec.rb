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
    expect(result).to eq("Hello, world!\n")
  end

  it "should interpret smallfuck code correctly" do
    code = "[*>[>*>]>]"
    tape = "11001"
    result = described_class.smallfuck(code, tape)
    expect(result).to eq("01100")
  end

  it "should interpret paintfuck code correctly" do
    code = "*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*"
    result = described_class.paintfuck(code, 100, 6, 9)
    expect(result).to eq("111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000")
  end
end
