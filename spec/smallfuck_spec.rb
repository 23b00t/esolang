# spec/interpreter_spec.rb
require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe "Smallfuck" do
  let(:code) do
    "[*>[>*>]>]"
  end

  it "should interpret smallfuck code correctly" do
    tape = "11001"
    result = Esolang.smallfuck(code, tape)
    expect(result).to eq("01100")
  end

  it "should add smallfuck String method" do
    tape = "11001"
    result = code.smallfuck(tape)
    expect(result).to eq("01100")
  end
end
