class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value, parent=nil, children=[])
        @value = value
        @parent = parent
        @children = children
    end

    def parent=(parent_node)
        if parent_node != parent
            # parent = nil if parent != nil
            # parent.remove_child(self)
            parent = parent_node
            parent_node.children << self if !parent_node.children.include?(self)
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



    # def bfs(value)
    #     tree1 = PolyTreeNode.new 
    #     while 
    #         curr_node = tree1.parent
    #         return curr_node if curr_node == value
    #         curr_node.children.each do |child|
    #             tree1 << child
    #         end
    #     end
    #     return nil
    # end



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