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
    expect(code.boolfuck.leo_bytes_to_s).to eq("Hello, world!\n")
  end

  it "should add smallfuck method" do
    code = "[*>[>*>]>]"
    tape = "11001"
    result = code.smallfuck(tape)
    expect(result).to eq("01100")
  end
end
