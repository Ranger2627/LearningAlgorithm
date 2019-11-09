//
//  Queue.swift
//  ddd
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class ArrayQueue<T>: CustomStringConvertible, Queue {
    private var array: NewArray<T>
    
    var description: String {
        var des = "front ["
        for i in 0 ..< array.getSize() {
            des += "\(array.get(index: i))"
            if i != (array.getSize() - 1) {
                des += ", "
            }
        }
        des += "] tail"
        return des
    }
    
    init(capacity: Int) {
        array = NewArray.init(capacity: capacity)
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    //MARK: - Stack
    func getSize() -> Int {
        return array.getSize()
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty()
    }
    
    func enqueue(element: T) {
        array.addLast(element: element)
    }
    
    func dequeue() -> T {
        return array.removeLast()
    }
    
    func getFront() -> T {
        return array.getFirst()
    }
}

class LoopQueue<T>: CustomStringConvertible, Queue {
    private var array: Array<T?>
    private var front = 0
    private var tail = 0
    private var size = 0
    
    var description: String {
        var des = "front ["
        var i = front
        while i != tail {
            des += String(describing: array[i])
            if i != (tail - 1) {
                des += ", "
            }
            i = (i + 1) % array.count
        }
        des += "] tail"
        return des
    }
    
    init(capacity: Int) {
        array = Array<T?>.init(repeating: nil, count: capacity)
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    //MARK: - Stack
    func getSize() -> Int {
        return size
    }
    
    func getCapacity() -> Int {
        return array.count - 1
    }
    
    func isEmpty() -> Bool {
        return front == tail
    }
    
    func enqueue(element: T) {
        if size == getCapacity() {
            resize(capacity: getCapacity() * 2)
        }
        array[tail] = element
        tail = (tail + 1) % array.count
        size += 1
    }
    
    func dequeue() -> T {
        if isEmpty() {
            fatalError("Queue is Empty")
        } else {
            if size == (getCapacity() / 4) {
                resize(capacity: getCapacity() / 2)
            }
            let t = array[front]!
            array[front] = nil
            front = (front + 1) % array.count
            size -= 1
            return t
        }
    }
    
    func getFront() -> T {
        if isEmpty() {
            fatalError("Queue is Empty")
        } else {
            return array[front]!
        }
    }
    
    private func resize(capacity: Int) {
        var newArray = Array<T?>.init(repeating: nil, count: capacity + 1)
        for i in 0 ..< size {
            newArray[i] = array[(front + i) % array.count]
        }
        front = 0
        tail = size
        array = newArray
    }
}
