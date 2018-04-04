# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  cur = head; prev = nil
  while cur
    nxt = cur.next
    cur.next = prev

    prev = cur
    cur = nxt
  end
  return prev
end
