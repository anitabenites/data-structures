# frozen_string_literal: true

RSpec.describe LinkedList do
  let(:list) { described_class.new }
  let(:node_one) do
    node = LinkedListNode.new
    node.value = 1
    node
  end
  let(:node_two) do
    node = LinkedListNode.new
    node.value = 2
    node
  end
  let(:node_three) do
    node = LinkedListNode.new
    node.value = 3
    node
  end

  describe 'in general' do
    it 'creates a new instance of self' do
      # raise error use lambda
      expect { LinkedList.new }.not_to raise_error
    end
  end

  describe '#add_first' do
    context 'with one node' do
      before do
        list.add_first(node_one)
      end

      it 'adds a node to the beginning of the list' do
        expect(list.head).to eql(node_one)
      end

      it 'makes head and tail the same' do
        expect(list.head).to eql(list.tail)
      end
    end

    context 'with more than one node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
      end

      it 'adds a node to the beginning of the list' do
        expect(list.head).to eql(node_three)
      end

      it 'points head to the next node' do
        expect(list.head.next).to eql(node_two)
      end
    end
  end
end
