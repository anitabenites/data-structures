# frozen_string_literal: true

class StackNode
  attr_accessor :value, :next
  def initialize(value:)
    @value = value
  end
end
