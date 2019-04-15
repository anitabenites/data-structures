class QueueList
  attr_accessor :head, :tail

  def initialize
    @counter = 0
  end

  def add(value)
    node = QueueNode.new(value: value)
    @head = @tail = node if @counter.zero?
    if @counter >= 1
      node = @head
      next_node = node.next
      @tail = next_node
      next_node.next = nil
    end
    @counter += 1
  end
end
