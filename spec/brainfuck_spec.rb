require 'spec_helper'
require_relative '../lib/esolang.rb'

using Esolang::Refinements

describe "Brainfuck" do
  let(:cell_width) do
    %(Calculate the value 256 and test if it's zero
    If the interpreter errors on overflow this is where it'll happen
    ++++++++[>++++++++<-]>[<++++>-]
    +<[>-<
        Not zero so multiply by 256 again to get 65536
        [>++++<-]>[<++++++++>-]<[>++++++++<-]
        +>[>
            # Print "32"
            ++++++++++[>+++++<-]>+.-.[-]<
        <[-]<->] <[>>
            # Print "16"
            +++++++[>+++++++<-]>.+++++.[-]<
    <<-]] >[>
        # Print "8"
        ++++++++[>+++++++<-]>.[-]<
    <-]<
    # Print " bit cells\n"
    +++++++++++[>+++>+++++++++>+++++++++>+<<<<-]>-.>-.+++++++.+++++++++++.<.
    >>.++.+++++++..<-.>>-
    Clean up used cells.
    [[-]<])
  end

  let(:code) do
    "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
  end

  let(:addition) do
    %(
      ,>,<    # write first byte of input to first cell | move right | add second input byte to second cell | move left
      [>+<-]  # add value of first cell to second and set first back to 0
      >.      # go to second cell and print result of addition
    )
  end

  it "should interpret brainfuck code correctly" do
    result = Esolang.brainfuck(code)
    expect(result).to eq("Hello World!\n")
  end

  it "should add brainfuck String method" do
    expect(code.brainfuck).to eq("Hello World!\n")
  end

  it "should implement cat" do
    expect(",[.,]".brainfuck("foo bar baz")).to eq("foo bar baz")
  end

  it "should print cell width" do
    expect(cell_width.brainfuck).to eq("8 bit cells\n")
  end

  it "should word for addition" do
    expect(addition.brainfuck('22')).to eq("d")
  end
end
