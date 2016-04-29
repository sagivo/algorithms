# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
    return true if root.nil?
    mirror(root.left, root.right)
end

def mirror(a,b)
    return a == b if (a == nil || b == nil)
    a.val == b.val && mirror(a.left, b.right) && mirror(a.right,b.left)
end

