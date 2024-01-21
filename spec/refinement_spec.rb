require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe String do
  it "should add boolfuck method" do
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
    expect(code.boolfuck).to eq("Hello, world!\n")
  end

  it "should add smallfuck method" do
    code = "[*>[>*>]>]"
    tape = "11001"
    result = code.smallfuck(tape)
    expect(result).to eq("01100")
  end

  it "should add paintfuck method" do
    code = "*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*"
    result = code.paintfuck(100, 6, 9)
    expect(result).to eq("111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000")
  end
end
