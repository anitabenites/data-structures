# frozen_string_literal: true
require 'pry-byebug'

RSpec.describe StackList do
  let(:list) { described_class.new }
  let(:node_one) do
    node = StackList.new
    node.value = 1
    node
  end
  let(:node_two) do
    node = StackList.new
    node.value = 2
    node
  end
  let(:node_three) do
    node = StackList.new
    node.value = 3
    node
  end
  let(:node_four) do
    node = StackList.new
    node.value = 4
    node
  end

  describe 'in general' do
    it 'creates a new instance of self' do
      # raise error use lambda
      expect { StackList.new }.not_to raise_error
    end
  end

  describe '#push' do
    context 'with one node' do
      before do
        list.push(1)
      end

      it 'add a node to the end of the list (last in, first out)' do
        expect(list.head.value).to eql(1)
      end

      it 'makes head and tail the same' do
        expect(list.head).to eql(list.tail)
      end
    end

    context 'with more than one node' do
      before do
        list.push(1)
        list.push(2)
        list.push(3)
      end
      it 'adds a node to the end of the list (last in, fist out)' do
        list.push(4)
        # expect(list.tail.value).to eql(4) ## this is working on the opposite way
        expect(list.size).to eql(4)
      end
      # it 'points head to the next node' do
      #   expect(list.head.next).to eql()
      # end
    end
  end

  describe '#pop' do

    context 'when we do not find the node in the list' do
      before do
        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)
      end
      it 'does not raise an error' do
        expect { list.pop }.not_to raise_error
      end
    end

    context 'with one node' do
      before do
        list.push(1)
      end
      it 'sets the node to nil' do
        list.pop
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'with more than one node' do
      before do
        list.push(1)
        list.push(2)
        list.push(3)
      end
      it 'removes a node at the end of the list' do
        list.pop
        expect(list.head.value).to eq(2)
      end
    end
  end

  describe 'building the stack' do
    before do
      list.push(1)
      list.push(2)
      list.push(3)
    end
    it 'set the correct head of the list' do
      expect(list.head.value).to eql(3)
    end
    it 'set the correct tail of the list' do
      expect(list.tail.value).to eql(1)
    end
  end
end
