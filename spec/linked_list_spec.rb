# frozen_string_literal: true
require 'pry-byebug'

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
  let(:node_four) do
    node = LinkedListNode.new
    node.value = 4
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

    context 'with one node' do
      before do
        list.add_first(node_one)
      end
      it 'sets the node to nil' do
        list.remove_last
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

  describe '#find' do
    context 'with more than one node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end
      it 'finds the third node of the list' do
        #1->2->3->4->nil
        #1->2->4->nil
        expect(list.find(1).value).to eql(1)
        expect(list.find(2).value).to eql(2)
        expect(list.find(3).value).to eql(3)
        expect(list.find(4).value).to eql(4)
        expect(list.find(6)).to eql(nil)
      end
    end
  end

  describe '#remove' do
    context 'when we do not find the node in the list' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end
      it 'does not raise an error'do
        expect { list.remove(6) }.not_to raise_error
      end
    end

    context 'with one node' do
      before do
        list.add_first(node_one)
      end
      it 'set the head and the tail to nil' do
        list.remove(1)
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'with two nodes' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
      end
      context 'when you delete the head' do
        it 'set the head to the tail' do
          list.remove(list.head.value)
          expect(list.head).to eql(list.tail)
        end
      end
      context 'when you delete the tail' do
        it 'set the tail to the head' do
          list.remove(list.tail.value)
          expect(list.head).to eql(list.tail)
        end
      end
    end

    context 'with more than two node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end

      it 'removes the third node of the list' do
        list.remove(3)
        expect(list.size).to eql(3)
        list.remove(2)
        expect(list.size).to eql(2)
        list.remove(1)
        expect(list.size).to eql(1)
        list.remove(4)
        expect(list.size).to eql(0)
      end

      it 'deletes the first node in the list' do
        list.remove(list.head.value)
        expect(list.head).to eql(node_two)
      end

      it 'deletes the last node in the list' do
        list.remove(list.tail.value)
        expect(list.tail).to eql(node_three)
      end
    end
  end

  describe '#each' do
    context 'with more than two node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end
      it 'returns each element of the list' do
        counter = 1
        list.each do |node|
          expect(node.value).to eq(counter)
          counter += 1
        end
      end
    end

    context 'with one node' do
      before do
        list.add_first(node_one)
      end
      it 'returns the node' do
        list.each do |node|
          expect(node.value).to eq(1)
        end
      end
    end

    context 'without nodes' do
      it 'does not raise an error' do
        expect { list.each }.not_to raise_error
      end
    end
  end

  describe '#map' do
    context 'with more than two node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end
      it 'returns an array with the same amount of elements' do
        result = list.map { |node| node.value += 1 }
        expect(result).to eql([2,3,4,5])
      end
    end
  end

  describe '#select' do
    context 'with more than two node' do
      before do
        list.add_first(node_one)
        list.add_first(node_two)
        list.add_first(node_three)
        list.add_first(node_four)
      end
      it 'returns an array with selected elements' do
        result = list.select { |node| node.value % 2 == 0 }
        expect(result).to eql([node_two,node_four])
      end

      it 'returns an empty array if no block is given' do
        expect(list.select).to be_empty
      end
    end
  end

end
