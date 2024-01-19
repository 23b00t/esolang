require 'spec_helper'
require_relative '../lib/refinements/refinements.rb'

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
end
