class Node
  attr_accessor(:value, :next_node)

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList

  def initialize()
    @head = nil
    @tail = @head
    @size = 0
  end

  def append(value)
    if !@head
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
    @size += 1
  end

  def prepend(value)
    if !@head
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value, @head)
    end
    @size += 1
  end

  def size
    return @size
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    curr = @head
    while curr && index > 0
      curr = curr.next_node
      index -= 1
    end

    return nil if index != 0 || !curr
    return curr.value
  end

  def pop
    if size == 1
      @head = nil
      @tail = @head
    else
      # get the node before tail
      curr = @head
      while curr.next_node != @tail
        curr = curr.next_node
      end
      curr.next_node = nil
      @tail = curr
    end

    @size -= 1
  end

  def contains?(value)
    curr = @head
    while(curr)
      return true if curr.value == value
      curr = curr.next_node
    end
    return false
  end

  def find(value)
    curr = @head
    index = 0
    while(curr)
      return index if curr.value == value
      curr = curr.next_node
      index += 1
    end

    return nil
  end

  # Extra credit
  def insert_at(value, index)
    if index > size()
      return nil
    end

    if index == 0
      prepend(value)
      return
    end

    if index == size()
      append(value)
      return
    end
    
    # find node before the index
    curr = @head
    while(index > 1) 
      curr = curr.next_node
      index -= 1
    end
    
    # curr = node before index
    prev = curr
    next_node = curr.next_node

    # new node
    new = Node.new(value, next_node)
    prev.next_node = new

    @size += 1
  end

  def remove_at(index)
    if !@head || index > size() - 1
      return nil
    end

    # last node
    if index == size() - 1 
      pop()
      return
    end

    if index == 0
      @head = @head.next_node
      @size -= 1
      return
    end

    # find the node before index
    curr = @head
    while index > 1
      curr = curr.next_node
      index -= 1
    end

    #curr = node before index
    curr.next_node = curr.next_node.next_node

    @size -= 1

  end


  def to_s()
    curr = @head
    str = ''

    while curr 
      str += "( #{curr.value} ) -> "
      curr = curr.next_node
    end

    str += 'nil'

    return str
  end

end
