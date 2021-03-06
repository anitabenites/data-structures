class QueueList
  attr_reader :head, :tail

  def initialize
    @counter = 0
  end

#enqueue elements: this adds a new item (or several items) at the back of the queue
  def enqueue(value)
    node = QueueNode.new(value: value)
    @head = @tail = node if @counter.zero?
    if @counter >= 1
      @tail.next = node
      @tail = node
    end
    @counter += 1
  end

  def dequeue(value)
   node = QueueNode.new(value: value)
    # throw new InvalidOperationException("The queue is empty") if @counter == 0
    if @counter == 1
      @head = @tail = nil
    end
    if @counter > 1
      node = @head.next
      @head = node
    end
    @counter -= 1
  end
end
