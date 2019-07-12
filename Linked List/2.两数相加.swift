/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var node = ListNode(-1)
        var current = node
        var chushu = 0

        while l1 != nil || l2 != nil {
            var sum = (l1?.val ?? 0) + (l2?.val ?? 0) + chushu
            chushu = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            l1 = l1?.next
            l2 = l2?.next
        }

        if chushu > 0 {
            current.next = ListNode(chushu)
        }
        return node.next
    }
}

