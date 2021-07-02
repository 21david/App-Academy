class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value, parent=nil, children=[])
        @value = value
        @parent = parent
        @children = children
    end

    def parent=(parent_node)
        if !parent_node == parent
            parent = nil if parent != nil
            parent = parent_node
            parent_node.children << self
        end
    end

    def add_child(child)
        # if child.parent != self
        child.parent = self
        children << child
        # end
    end

    def remove_child(child)
        raise if !children.include?(child)
        idx = children.index(child)
        child.parent = nil
        children.delete_at(idx)
    end

    
end