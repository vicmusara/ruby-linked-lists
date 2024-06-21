# frozen_string_literal: true

class LinkedList
  attr_accessor :head

  def initialize
    @head
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node =new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  attr_reader :head

  def tail
    current = @head
    return nil if current.nil?

    current = current.next_node while current.next_node
    current
  end

  def at(index)
    current = @head
    count = 0
    while current
      return current if count == index

      count += 1
      current = current.next_node
    end
    nil
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_value = @head.value
      @head = nil
      return popped_value
    end
    current = @head
    current = current.next_node while current.next_node&.next_node
    popped_value = current.next_node.value
    current.next_node = nil
    popped_value
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    result = ''
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result + 'nil'
  end
end
