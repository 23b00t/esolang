require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe "Brainfuck" do
  let(:code) do
    "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
  end

  it "should interpret brainfuck code correctly" do
    p result = Esolang.brainfuck(code)
    expect(result).to eq("Hello World!\n")
  end

  it "should add brainfuck String method" do
    expect(code.brainfuck).to eq("Hello World!\n")
  end
end
