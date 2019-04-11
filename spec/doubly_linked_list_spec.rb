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
        expect(list.head.next).to eql(2)
        expect(list.tail.previous).to eql(1)
        expect(list.tail.next).to be_nil
      end

      it 'correctly sets the pointers of the third node' do
        list.add(1)
        list.add(2)
        list.add(3)
        expect(list.head.value).to eql(1)
        expect(list.head.previous).to be_nil
        expect(list.head.next).to eql(2)
        expect(list.tail.value).to eql(3)
        expect(list.tail.previous).to eql(2)
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

  # describe '#remove' do
  #
  # end
end
