require 'pry-byebug'

RSpec.describe DoublyLinkedList do
  let(:list) { described_class.new }
  let(:node_one) do
    node = DoublyLinkedListNode.new
    node.value = 1
    node
  end
  let(:node_two) do
    node = DoublyLinkedListNode.new
    node.value = 2
    node
  end
  let(:node_three) do
    node = DoublyLinkedListNode.new
    node.value = 3
    node
  end
  let(:node_four) do
    node = DoublyLinkedListNode.new
    node.value = 4
    node
  end

  describe 'in general' do
    it 'creates a new instance of self' do
      expect { DoublyLinkedList.new }.not_to raise_error
    end
  end

  describe '#add' do
    context 'with one node' do
      before do
        list.add(node_one)
      end
      it 'adds a node to the beginning of the list' do
        expect(list.head).to eql(node_one)
      end

      it 'makes head and tail the same' do
        expect(list.head).to eql(list.tail)
      end
    end

    context 'with more than one node' do

      it 'correctly sets the pointers of the first node' do
        list.add(node_one)
        expect(list.head).to eql(node_one)
        expect(list.head.previous).to be_nil
        expect(list.head.next).to be_nil
      end

      it 'correctly sets the pointers of the second node' do
        list.add(node_one)
        list.add(node_two)
        expect(list.head).to eql(node_one)
        expect(list.head.previous).to eql(nil)
        expect(list.head.next.value).to eql(node_two.value)
        expect(list.tail.previous.value).to eql(node_one.value)
        expect(list.tail.next).to eql(nil)
      end

      it 'adds a node at the end of the list' do
        list.add(node_one)
        list.add(node_two)
        list.add(node_three)
        expect(list.tail.value).to eql(node_three.value)
      end

    end
  end
end
