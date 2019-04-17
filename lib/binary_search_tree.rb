require 'pry-byebug'

class BinarySearchTree
  attr_accessor :root_node

  # def initialize(root_value=nil)
  #   @root_node = BinarySearchTreeNode.new(root_value)
  # end

  def insert(value)
    node = BinarySearchTreeNode.new(value:value)
    # self.root_node = node if root_node.nil?
    @root_node = node if root_node.nil?
    # root_node = node if root_node.nil?
  end
end
