class Array
  def /(n)
    a = self.dup
    sets = []
    while not a.empty?
      set = []
      n.times { set << a.pop }
      sets << set.compact
    end
    return sets
  end
end