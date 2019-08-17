class MaxStack
  def initialize()
    @q = []
    @q2 = []
  end

  def push(x)
    max = @q.any? ? [x, @q.last[1]].max : x
    @q << [x, max]
    x
  end

  def pop()
    return nil unless @q.any?

    ret = @q.pop[0]
    ret
  end

  def top()
    return nil unless @q.any?
    @q.last[0]
  end

  def peek_max()
    return nil unless @q.any?
    @q.last[1]
  end


  def pop_max()
    return nil unless @q.any?
    max = @q.last[1]
    q2 = []

    while top() != max
      q2 << pop()
    end
    pop()

    while q2.any?
      push(q2.pop)
    end
    max
  end
end
