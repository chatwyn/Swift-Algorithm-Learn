/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第N个节点
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var node = head
        var first = node
        var next = node
        var count = 0
        while next != nil {
            next = next?.next
            if count == n + 1 {
                first = first?.next
            } else {
                count += 1
            }
        }
        if count == n + 1 {
            first?.next = first?.next?.next
        } else if count == n {
            node = node?.next
        }
        return node
    }
}

