class ConnectedComponents
  require_relative 'graph'
  require 'set'

  def get_groups matrix, value
    graph =  create_graph_by_value matrix, value
    count = 0
    visited = Set.new
    graph.list.keys.each do|node|
      unless visited.include? node
     #   p visited ,node
        count=count+1
        dfs graph, node, visited
      end

    end
    count
  end




  def dfs graph, node,visited
    unless visited.include? node
      visited << node
      graph.list[node].each do |neighbour|
        dfs(graph,neighbour, visited)
      end
    end
  end

  def create_graph_by_value matrix,value

    #We can take a single length as it is n*n matrix. But for sake of scalability computing different length for row and column

    graph = Graph.new
    (0..matrix.length-1).each do|row|
      (0..matrix[0].length-1).each do|col|
        key = get_key row,col
        if col<matrix[0].length-1 && matrix[row][col]==value && matrix[row][col+1]==value
          graph.add_edge key, get_key(row,col+1)
        end
        if col>=1 && matrix[row][col]==value && matrix[row][col-1]==value
          graph.add_edge key, get_key(row,col-1)
        end
        if row < matrix.length - 1 and matrix[row][col]==value and matrix[row+1][col]==value
          graph.add_edge key, get_key(row+1,col)
        end
        if row >= 1 and matrix[row][col]==value and matrix[row-1][col]==value
          graph.add_edge key, get_key(row-1,col)
        end
        if col <= matrix[0].length-1 and row <= matrix.length-1 and matrix[row][col]==value
          graph.add_edge key,get_key(row,col)
        end
      end
    end
    graph
  end

  def get_key row, col
   "a#{row}#{col}"
  end


end
matrix = [[1,0,1,1,],[0,1,0,0,],[1,0,1,1],[1,0,0,0,]]
one,zero = (ConnectedComponents.new.get_groups matrix, 1),( ConnectedComponents.new.get_groups matrix, 0)
p [one,zero]




