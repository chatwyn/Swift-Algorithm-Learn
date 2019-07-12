/*
 * @lc app=leetcode.cn id=24 lang=swift
 *
 * [24] 两两交换链表中的节点
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var node = head?.next != nil ? head!.next! : head
        var current = head
        var preCurrent: ListNode? = nil
        while  current != nil && current?.next != nil {
            var tmp = current?.next?.next
            current?.next?.next = current
            preCurrent?.next = current?.next
            current?.next = tmp
            preCurrent = current
            current = tmp         
        }
        return node
        
    }
}

