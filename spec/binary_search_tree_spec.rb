
RSpec.describe BinarySearchTree do
  let(:tree) { described_class.new }
  describe '#insert' do

    context 'with no node' do
      it 'insert a new node to the tree' do
        tree.insert(1)
        expect(tree.root_node.value).to eql(1)
      end
    end

    # context 'with one node' do
    #   it ''
    # end
    #
    # context 'with 2 nodes' do
    #   it ''
    # end
    #
    # context 'with 3 nodes' do
    #   it ''
    # end
    #
    # context 'with 4 nodes' do
    #
    # end
  end
end
