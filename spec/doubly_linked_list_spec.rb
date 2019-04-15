require 'pry-byebug'

RSpec.describe DoublyLinkedList do
  let(:list) { described_class.new }

  describe 'in general' do
    it 'creates a new instance of self' do
      expect { DoublyLinkedList.new }.not_to raise_error
    end
  end

  describe '#add' do
    context 'with one node' do
      before do
        list.add(1)
      end
      it 'adds a node to the beginning of the list' do
        expect(list.head.value).to eql(1)
      end

      it 'makes head and tail the same' do
        expect(list.head).to eql(list.tail)
      end
    end

    context 'with more than one node' do

      it 'correctly sets the pointers of the first node' do
        list.add(1)
        expect(list.head.value).to eql(1)
        expect(list.head.previous).to be_nil
        expect(list.head.next).to be_nil
      end

      it 'correctly sets the pointers of the second node' do
        list.add(1)
        list.add(2)
        expect(list.head.value).to eql(1)
        expect(list.head.previous).to be_nil
        expect(list.head.next.value).to eql(2)
        expect(list.tail.previous.value).to eql(1)
        expect(list.tail.next).to be_nil
      end

      it 'correctly sets the pointers of the third node' do
        list.add(1)
        list.add(2)
        list.add(3)
        expect(list.head.value).to eql(1)
        expect(list.head.previous).to be_nil
        expect(list.head.next.value).to eql(2)
        expect(list.tail.value).to eql(3)
        expect(list.tail.previous.value).to eql(2)
        expect(list.tail.next).to be_nil
      end

      it 'adds a node at the end of the list' do
        list.add(1)
        list.add(2)
        list.add(3)
        expect(list.tail.value).to eql(3)
      end
    end
  end
################### remove method ###########################

  describe '#remove' do
    context 'when we do not find the node in the list' do
      before do
        list.add(1)
        list.add(2)
        list.add(3)
        list.add(4)
      end
      it 'does not raise an error' do
        expect { list.remove(5) }.not_to raise_error
      end
    end

    context 'with one node' do
      before do
        list.add(1)
      end
      it 'set the head and tail to nil' do
        list.remove(1)
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'with two nodes' do
      before do
        list.add(1)
        list.add(2)
      end

      context 'when you delete the head' do
        it 'set the value of the head to the value of the tail' do
          list.remove(1)
          expect(list.head.value).to eql(2)
          expect(list.tail.value).to eql(2)
          expect(list.tail.previous).to be_nil
          expect(list.tail.next).to be_nil
        end
      end

      context 'when you delete the tail' do
        it 'the head becomes the tail' do
          list.remove(2)
          expect(list.head.value).to eql(1)
          expect(list.tail.value).to eql(1)
          expect(list.tail.next).to be_nil
          expect(list.head.previous).to be_nil
        end
      end

      context 'when deleting the head' do
        it 'the next node becomes the head' do
          list.remove(1)
          expect(list.head.value).to eql(2)
          expect(list.tail.value).to eql(2)
          expect(list.tail.next).to be_nil
          expect(list.head.previous).to be_nil
        end
      end
    end

    context 'with more than two nodes' do
      before do
        list.add(1)
        list.add(2)
        list.add(3)
        list.add(4)
      end

      it 'removes the third node of the list' do
        list.remove(3)
        expect(list.tail.previous.value).to eql(2)
      end

      it 'removes the first node in the list' do
        list.remove(1)
        expect(list.head.value).to eql(2)
        expect(list.head.previous).to be_nil
        expect(list.head.next.value).to eql(3)
      end

      it 'removes the last node in the list' do
        list.remove(4)
        expect(list.tail.value).to eql(3)
      end
    end
  end
end
