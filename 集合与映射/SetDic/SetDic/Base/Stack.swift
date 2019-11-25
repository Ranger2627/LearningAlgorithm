//
//  Stack.swift
//  ddd
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class ArrayStack<T>: CustomStringConvertible, Stack {
    private var array: NewArray<T>
    
    var description: String {
        var des = "["
        for i in 0 ..< array.getSize() {
            des += "\(array.get(index: i))"
            if i != (array.getSize() - 1) {
                des += ", "
            }
        }
        des += "] top"
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
    
    func push(element: T) {
        array.addLast(element: element)
    }
    
    func pop() -> T {
        return array.removeLast()
    }
    
    func top() -> T {
        return array.getLast()
    }
}

class LinkedStack<T: Comparable>: CustomStringConvertible, Stack {
    private let list = LinkedList<T>()
    
    //MARK: - Stack
     func getSize() -> Int {
         return list.getSize()
     }
     
     func isEmpty() -> Bool {
         return list.isEmpty()
     }
     
     func push(element: T) {
         list.addFirst(element: element)
     }
     
     func pop() -> T {
         return list.removeFirst()!
     }
     
     func top() -> T {
         return list.getFirst()!
     }
    
    var description: String {
        var des = "Stack: top"
        des += String.init(describing: list)
        return des
    }
}
