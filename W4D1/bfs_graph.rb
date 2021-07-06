require 'set'

class GraphNode
    attr_reader :neighbors, :value

    def initialize(val)
        @value = val
        @neighbors = []
    end

    def add_neighbors(*graph_nodes)
        graph_nodes.each do |g_n|
            add_neighbor(g_n)
        end
    end

    def add_neighbor(graph_node)
        @neighbors << graph_node
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

a.add_neighbors(c, e, b)
c.add_neighbors(b, d)
e.add_neighbors(a)
f.add_neighbors(e)


def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new

    until queue.empty?
        cur_node = queue.shift
        next if visited.include?(cur_node)

        return cur_node if cur_node.value == target_value
        visited << cur_node

        cur_node.neighbors.each do |neighbor|
            queue << neighbor
        end
    end
end

p bfs(a, "b")
p bfs(a, "f")