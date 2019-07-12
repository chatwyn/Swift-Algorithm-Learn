/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node = ListNode(0)
        var current = node
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                current.next = l1
                l1 = l1!.next
            } else {
                current.next = l2
                l2 = l2!.next
            }
            current = current.next!
        }
        current.next = l1 != nil ? l1 : l2
        return node.next
        
    }
}

