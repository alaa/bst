class Node
  attr_accessor :value, :right, :left

  def initialize value
    @value = value
    @right = nil
    @left = nil
  end
end

class Bst
  attr_accessor :length, :root

  def initialize
    @length = 0
    @root = nil
  end

  def insert(data)
    if data.is_a? (Array)
      data.each do |number|
        insert_one number
      end
    else
      insert_one data
    end
  end

  private
  def _insert(root, number)
    if number < root.value
      if root.left.nil?
        @length += 1
        root.left = Node.new number
        puts "Left"
      else
        _insert(root.left, number)
      end
    elsif number > root.value
      if root.right.nil?
        @length += 1
        root.right = Node.new number
        puts "right"
      else
        _insert(root.right, number)
      end
    else
      _insert root.right, number
    end
  end

  def insert_one number
    if @root.nil?
      @length += 1
      puts "ROOT"
      @root = Node.new number
    else
      _insert(@root, number)
    end
  end
end


bst = Bst.new

data = (1..10).to_a.shuffle
print data
puts ""

bst.insert data
