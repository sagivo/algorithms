# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def set_integer(value)
#        """
#        Set this NestedInteger to hold a single integer equal to value.
#        @return {Void}
#        """
#
#    def add(elem)
#        """
#        Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
#        @return {Void}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

# @param {NestedInteger[]} nested_list
# @return {Integer}

def depth_sum_inverse(nested_list)
  h = {}
  lvl = 0

  while nested_list.any?
    q = []
    lvl+=1
    h[lvl] = 0

    nested_list.each do |n|
      if n.is_integer()
        h[lvl] += n.get_integer
      else
        q << n.get_list()
      end
    end

    nested_list = q.flatten
  end

  sum = 0

  h.each do |k, v|
    sum += ((lvl-k+1) * v)
  end

  sum
end
