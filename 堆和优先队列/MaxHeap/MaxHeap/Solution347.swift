//
//  Solution347.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/11/26.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class Solution347 {    
    struct Node: Comparable {
        static func < (lhs: Node, rhs: Node) -> Bool {
            if lhs.cishu < rhs.cishu {
                return false
            }
            return true
        }
        
        var e = 0
        var cishu = 0
  
    }
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic:[Int: Int] = [:]
        for i in nums {
            dic[i, default: 0] += 1
        }
        
        let heap = HeapQueue<Node>.init()
        for (key, value) in dic {
            let node = Node.init(e: key, cishu: value)
            if heap.getSize() < k {
                heap.enqueue(element: node)
            } else {
                if value > heap.getFront().cishu {
                    let _ = heap.dequeue()
                    heap.enqueue(element: Node.init(e: key, cishu: value))
                }
            }
        }
        var arr: [Int] = []
        for _ in 0..<heap.getSize() {
            arr.append(heap.dequeue().e)
        }
        return arr
    }
}
