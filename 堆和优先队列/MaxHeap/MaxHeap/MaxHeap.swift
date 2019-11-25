//
//  MaxHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/11/25.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class MaxHeap<T: Comparable> {
    private var array: Array<T>
    
    init(capacity: Int) {
        self.array = Array<T>.init()
        self.array.reserveCapacity(capacity)
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    func getSize() -> Int {
        return array.count
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    private func parent(index: Int) -> Int {
        if index == 0 {
            fatalError("0 no parent!")
        }
        return (index - 1) / 2
    }
    
    private func leftChild(index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChild(index: Int) -> Int {
        return index * 2 + 2
    }
    
    func add(element: T) {
        array.append(element)
        var k = getSize() - 1
        siftUp(k: &k)
    }
    
    private func siftUp(k: inout Int) {
        while k > 0 && array[k] > array[parent(index: k)] {
            array.swapAt(k, parent(index: k))
            k = parent(index: k)
        }
    }
    
    func findMax() -> T {
        if array.isEmpty {
            fatalError("heap is empty!")
        }
        return array[0]
    }
    
    func extractMax() -> T {
        let max = findMax()
        array[0] = array[getSize() - 1]
        array.removeLast()
        var k = 0
        siftDown(k: &k)
        return max
    }
    
    private func siftDown(k: inout Int) {
        var j = 0
        while leftChild(index: k) < getSize() {
            j = leftChild(index: k)
            if rightChild(index: k) < getSize() && array[j] < array[j + 1] {
                j = rightChild(index: k)
            }
            if array[k] < array[j] {
                array.swapAt(k, j)
            }
            k = j
        }
    }
    
}
