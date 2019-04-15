# frozen_string_literal: true
require 'pry-byebug'

class LinkedList
  # include Enumerable
  attr_accessor :head, :tail
  def initialize
    @counter = 0
  end

  def size
    @counter
  end

  def add_first(node)
    node.next = nil
    @head = @tail = node if @counter.zero?
    if @counter >= 1
      @tail.next = node
      #tail becomes node
      @tail = node
    end
    @counter += 1
  end

  def remove_first
    return if @counter.zero?

    if @counter == 1
      @head = @tail = nil
    elsif @counter > 1
      @head = @head.next
    end
    @counter -= 1
  end

  def remove_last
    return if @counter.zero?

    return @head = @tail = nil if @counter == 1

    temp = @head
    while temp.next != @tail do
      temp = temp.next
    end
    temp.next = nil
    @tail = temp
    @counter -= 1
  end

  def find(val)
    return @head if @head.value == val
    return @tail if @tail.value == val

    temp = @head

    while temp.next.value != val do
      temp = temp.next
      return nil if temp == @tail
    end
    temp.next
  end

#################### remove general method #######################
  def remove(val)
    # binding.pry
    if size == 1 && @head.value == val
      @head = @tail = nil
    else
      current_node = @head
      previous = nil
      if current_node.value == val
        @head = current_node.next
        current_node.next = nil
      else
        while current_node.value != val do
          return nil if current_node == @tail
          previous = current_node
          current_node = current_node.next
        end
        # binding.pry
        next_node = current_node.next
        previous.next = next_node unless
        current_node.next = nil
        @tail = previous if next_node.nil?
      end
    end
    @counter -= 1
  end

######################### each method ################################

  def each
    current_node = @head
    while current_node != nil do
      yield current_node
      current_node = current_node.next
    end
  end

  def map(&block)
    result = []
    each do |node|
      # I am calling the block method because I am doing a transformation
      result << block.call(node)
    end
    result
  end

  def select(&block)
    return [] unless block_given?
    result = []
    each do |node|
      # I am appending the node no transformation happends
      result << node if block.call(node) == true
    end
    result
  end

end
