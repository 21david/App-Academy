require 'byebug'
class PolyTreeNode
    attr_accessor :value, :parent, :children
    def initialize(value, parent=nil, children=[])
        @value = value
        @parent = parent
        @children = children
    end

    def parent=(parent_node)
        return if self.parent == parent_node
        # debugger
        # if parent_node != parent && parent_node != nil
        if self.parent != nil
            # debugger
            # if parent == nil
            
            # parent.remove_child(self)
            # if self already has a parent, remove self from parent
            self.parent.children.delete(self) if !self.parent.children.include?(self)
            # parent = nil if parent != nil
            # children.delete(child)
            
        end
        @parent = parent_node
        if parent_node != nil
            self.parent.children << self if !parent.children.include?(self)
        end
    end

    def add_child(child)
        # if child.parent != self
        child.parent = self
        children << child if !children.include?(child)
        # end
    end

    def remove_child(child)
        raise if !children.include?(child)
        child.parent = nil
        children.delete(child)
    end



    def bfs(value)
        tree1 = [self] 

        while !tree1.empty?
            # debugger
            curr_node = tree1.shift
            return curr_node if curr_node.value == value
            curr_node.children.each do |child|
                tree1 << child
            end
        end
        return nil
    end

    def dfs(value)
        stack_1 = Array.new 
        stack_1 << self       
        while stack_1.length > 0
            curr_node = stack_1.pop
            return curr_node if curr_node == value
            curr_node.children.each do |child|
                stack_1 << child
            end
        end
        return nil
    end

    
end