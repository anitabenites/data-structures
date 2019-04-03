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
        expect(list.head).to eql(node_one)
      end

      it 'points head to the next node' do
        expect(list.head.next).to eql(node_two)
      end
    end
  end

  describe '#remove_first' do

    context 'when the list is empty' do
      it 'does not raise an error'do
        expect { list.remove_first }.not_to raise_error
      end
    end

    context 'with one node' do
      before do
        list.add_first(node_one)
      end
      it 'sets the node to nil' do
        list.remove_first
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'with more than one node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
      end
      it 'removes a node at the beginning of the list' do
        list.remove_first
        expect(list.head).to eq(node_two)
      end
    end
  end

  describe '#remove_last' do

    context 'when the list is empty' do
      it 'does not raise an error' do
        expect { list.remove_last }.not_to raise_error
      end
    end

    # context 'with one node' do
    #   before do
    #     list.add_first(node_one)
    #   end
    #   it 'sets the node to nil' do
    #     list.remove_last
    #     expect(list.head).to be_nil
    #     expect(list.tail).to be_nil
    #   end
    # end

    context 'with more than one node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
      end
      it 'removes a node at the end of the list' do
        list.remove_last
        expect(list.tail).to eq(node_two)
      end
    end
  end

  describe 'building the list' do
    before do
      list.add_first(node_one)
      list.add_first(node_two)
      list.add_first(node_three)
    end
    it 'set the correct head of the list' do
      expect(list.head).to eql(node_one)
    end
    it 'set the correct tail of the list' do
      expect(list.tail).to eql(node_three)
    end
  end

end
