# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
    q = [[root]]
    res = []
    while q.any?
        nodes = q.shift
        new_list = []
        last = nil
        nodes.each do |n| 
            if n
                new_list += [n.left,n.right] 
                last = n
            end
        end
        q << new_list if new_list.any?
        res << last.val if last
    end
    return res
end

# p right_side_view([1,2,3,null,5,null,4]) # => [1,3,4]
