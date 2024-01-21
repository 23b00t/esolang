require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe "Boolfuck" do
  let(:boolfuck_code) do
    ";;;+;+;;+;+;
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
  end

  let(:reverse_code) do
    ">,>,>,>,>,>,>,>,<<<<<<<<
    >>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]
    >>>>>>>>>
    >,>,>,>,>,>,>,>,<<<<<<<<
    >>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]
    <<<<<<<<<
    >>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]
    >;>;>;>;>;>;>;>;<<<<<<<<
    <<<<<<<<<
    >>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]"
  end

  let(:invalid_code) do
    "[[]"
  end

  it "should interpret boolfuck code correctly" do
    result = Esolang.boolfuck(boolfuck_code)
    expect(result).to eq("Hello, world!\n")
  end

  it "should add boolfuck String method" do
    expect(boolfuck_code.boolfuck).to eq("Hello, world!\n")
  end

  it "should work with input" do
    expect(reverse_code.boolfuck('Reverse_me')).to eq("em_esreveR")
  end

  it "should raise an error if the code is invalid" do
    expect { invalid_code.boolfuck }.to raise_error(StandardError, "Invalid code: No matching ']' for '[' at index 0")
  end
end
