class StackList
  attr_accessor :head, :tail
  def initialize
    @counter = 0
  end

  def size
    @counter
  end
############## push method #################
  def push(value)
    node = StackNode.new(value: value)
    if size == 0
      @tail = node
    end
    node.next = @head
    @head = node
    @counter += 1
  end

############# pop method ###################

   def pop
     return nil unless size > 0
     temp = @head
     @head = @head.next
     @tail = nil if size == 1
     @counter -= 1
     temp.value
   end
end
