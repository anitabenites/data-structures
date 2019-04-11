require 'pry-byebug'

class DoublyLinkedList
  attr_accessor :head, :tail
  def initialize
    @counter = 0
  end

  def size
    @counter
  end

  def add(value)
    node = DoublyLinkedListNode.new(value: value)

    @head = @tail = node if @counter.zero?

    if @counter >= 1
      @tail.next = node.value
      node.previous = @tail.value
      @tail = node
    end
    @counter += 1
  end
end
