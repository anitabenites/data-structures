
RSpec.describe BinarySearchTree do
  let(:tree) { described_class.new }

  describe '#insert' do

    context 'with no node' do
      it 'insert a new node to the tree' do
        tree.insert(4)
        expect(tree.root_node.value).to eql(4)
      end
    end

    context 'with one node' do
      before do
        tree.insert(4)
      end
      it 'insert a new node to the left of the root' do
        tree.insert(2)
        expect(tree.root_node.left.value).to eql(2)
      end
      it 'insert a new node to the right side of the root' do
        tree.insert(6)
        expect(tree.root_node.right.value).to eql(6)
      end
    end

    context 'with 7 nodes' do
      before do
        tree.insert(4)
        tree.insert(2)
        tree.insert(6)
      end
      it 'insert a new node to the left of the parent node' do
        tree.insert(1)
        expect(tree.root_node.left.left.value).to eql(1)
      end
      it 'insert a new node to the right of the parent node' do
        tree.insert(3)
        expect(tree.root_node.left.right.value).to eql(3)
      end

      it 'insert a new node to the right of the parent node' do
        tree.insert(7)
        expect(tree.root_node.right.right.value).to eql(7)
      end

      it 'insert a new node to the left of the parent node' do
        tree.insert(5)
        expect(tree.root_node.right.left.value).to eql(5)
      end
    end
    #TO DO: when we have the same value!

    context 'with 3 nodes when the node have the same value' do
      before do
        tree.insert(4)
        tree.insert(2)
        tree.insert(6)
      end
      #it 'inserts a node that already exits ' do
      #  tree.insert(2)
      #  expect(tree.root_node.left.value).to exist
      #end
    end
  end

  describe '#find' do
    context 'with 3 nodes' do
      let(:values) { [4,2,6] }
      before do
        values.each { |val| tree.insert(val) }
      end
      it 'finds the nodes' do
        values.each do |val|
          expect(tree.find(val).value).to eql(val)
        end
      end
       it 'returns nil if the node can not be found' do
         expect(tree.find(9)).to be_nil
       end
    end
  end

  describe '#remove' do
    context 'with 3 nodes' do
      let(:values) { [4, 2, 6] }
      before do
        values.each { |val| tree.insert(val) }
      end
      it 'removes a node' do
        expect(tree.remove(2)).to be_nil
      end
    end
  end
end
