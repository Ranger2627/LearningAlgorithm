//
//  HeapQueue.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/11/26.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation
 

protocol Queue {
     associatedtype ItemType
     
     func getSize() -> Int
     func isEmpty() -> Bool
     func enqueue(element: ItemType)
     func dequeue( ) -> ItemType
     func getFront() -> ItemType
 }

 class HeapQueue<T: Comparable>: Queue {
     typealias ItemType = T
     
     private let heap: MaxHeap<T>
     init() {
         self.heap = MaxHeap<T>()
     }
     
     func getSize() -> Int {
         return heap.getSize()
     }
     
     func isEmpty() -> Bool {
         return heap.isEmpty()
     }
     
     func enqueue(element: T) {
         heap.add(element: element)
     }
     
     func dequeue() -> T {
         return heap.extractMax()
     }
     
     func getFront() -> T {
         return heap.findMax()
     }

 }
