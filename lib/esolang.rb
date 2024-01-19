# esolang/lib/esolang.rb
require 'esolang/interpreters/boolfuck_interpreter'
require 'esolang/interpreters/smallfuck_interpreter'

module Esolang
  def self.boolfuck(code, input = '')
    Esolang::Interpreters::Boolfuck.new.run(code, input)
  end

  def self.smallfuck(code, input = '')
    Esolang::Interpreters::Smallfuck.new.run(code, input)
  end
end
