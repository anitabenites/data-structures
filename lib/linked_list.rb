# frozen_string_literal: true

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @counter = 0
  end

  def add_first(node)
    temp = @head
    @head = node
    @head.next = temp

    @counter += 1
    @tail = @head if @counter == 1
  end
end
