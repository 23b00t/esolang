# spec/interpreter_spec.rb
require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe "Boolfuck" do
  let(:code) do
    "*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*"
  end

  it "should interpret paintfuck code correctly" do
    result = Esolang.paintfuck(code, 100, 6, 9)
    expect(result).to eq("111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000")
  end

  it "should add paintfuck String method" do
    result = code.paintfuck(100, 6, 9)
    expect(result).to eq("111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000")
  end
end
