# frozen_string_literal: true
require 'pry-byebug'

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @counter = 0
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
    return if @counter == 0
    if @counter == 1
      @head = @tail = nil
    elsif @counter > 1
      @head = @head.next
    end
    @counter -= 1
  end

  def remove_last
    return if @counter == 0
    temp = @head
    while temp.next != @tail do
      temp = temp.next
    end
    temp.next = nil
    @tail = temp
    @counter -= 1
  end

end
