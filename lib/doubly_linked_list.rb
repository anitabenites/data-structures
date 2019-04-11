class DoublyLinkedList
  attr_accessor :head, :tail
  def initialize
    @counter = 0
  end

  def size
    @counter
  end

  def add(node)
    node.previous = nil
    node.next = nil
    @head = @tail = node if @counter.zero?
    if @counter >= 1
      @tail.next = node
      @tail = node
      node.next = nil
      node.previous = @head
    end
    @counter += 1
  end
end
