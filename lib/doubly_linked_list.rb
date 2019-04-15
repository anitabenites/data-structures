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
      @tail.next = node
      node.previous = @tail
      @tail = node
    end
    @counter += 1
  end

####### remove method #########################
  def remove(val)
    return if size < 1

    if size == 1 && @head.value == val
      @head = @tail = nil
    else
      current_node = @head

      size.times do
        break unless current_node.value != val
      # while current_node && current_node.value != val do
        current_node = current_node.next
      end

      return unless current_node

      previous_node = current_node.previous
      next_node = current_node.next

      previous_node.next = current_node.next unless previous_node.nil?
      next_node.previous = current_node.previous unless next_node.nil?

      if previous_node && previous_node.previous.nil?
        @head = previous_node
      end

      if previous_node && previous_node.next.nil?
        @tail = previous_node
      end

      if next_node && next_node.next.nil?
        @tail = next_node
      end

      if next_node && next_node.previous.nil?
        @head = next_node
      end

      # current_node.next = @head.next
      # if current_node.value == val
      #   @head = current_node.next
      #   current_node.previous = nil
      #   @tail = current_node.next
      # end
    end
    @counter -= 1
  end
end
