require 'pry-byebug'

class BinarySearchTree
  attr_accessor :root_node

  # def initialize(root_value=nil)
  #   @root_node = BinarySearchTreeNode.new(root_value)
  # end

  def insert(value)
    node = BinarySearchTreeNode.new(value:value)
    return @root_node = node if root_node.nil?
    temp = @root_node

    while true #TO DO
      if node.value < temp.value
        if temp.left == nil
          temp.left = node
          return
        else
          temp = temp.left
        end
      else
        if temp.right == nil
          temp.right = node
          return
        else
          temp = temp.right
        end
      end
    end
  end

  def find(value)
    find_node(root_node, value)
  end

  def find_node(node, value)
    return nil unless node
    return node if node.value == value
    if value < node.value
      find_node(node.left, value)
    else
      find_node(node.right, value)
    end
  end

  def remove(value)
    remove_node(root_node, value)
  end

  # def remove_node(value)
  #
  # end
end
