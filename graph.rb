class Graph
  attr_accessor :list
  def initialize
    @list = {} #Adjacency List
  end

  def add_edge origin, destination
    @list[origin] ? @list[origin] << destination : @list[origin]=[destination]
  end
end