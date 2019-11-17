//
//  LeetCode203.swift
//  ddd
//
//  Created by 周一见 on 2019/11/16.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class ListNode: CustomStringConvertible {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(array: [Int]) {
        if array.isEmpty {
            fatalError("array is empty")
        }
        self.val = array[0]
        var cur: ListNode? = self
        for i in 1..<array.count {
            cur?.next = ListNode.init(array[i])
            cur = cur?.next
        }
    }
    
    var description: String {
        var des = ""
        var current: ListNode? = self
        while current != nil {
            des = des + "\(current!.val)" + "->"
            current = current?.next
        }
        des += "nil"
        return des
    }
    
    
}

class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyHead = ListNode.init(-1)
        dummyHead.next = head
        var pre: ListNode? = dummyHead
        while pre?.next != nil {
            if pre?.next?.val == val {
                let cur = pre?.next
                pre?.next = cur?.next
                cur?.next = nil
            } else {
                pre = pre?.next
            }
        }
        return dummyHead.next
    }
    
    //递归调用
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        head?.next = removeElements2(head?.next, val)
        return head?.val == val ? head?.next : head
    }
}
