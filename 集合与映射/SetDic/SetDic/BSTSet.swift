//
//  BSTSet.swift
//  SetDic
//
//  Created by 周一见 on 2019/11/22.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class BSTSet<T: Comparable>: SetP {
    private let bst = BST<T>()
    
    func getSize() -> Int {
        return bst.getSize()
    }
    
    func isEmpty() -> Bool {
        return bst.isEmpty()
    }
    
    func add(element: T) {
        bst.add(element: element)
    }
    
    func remove(element: T) {
        bst.remove(element: element)
    }
    
    func contains(element: T) -> Bool {
        return bst.contains(element: element)
    }
    
}

class LinkedListSet<T: Comparable>: SetP {
    private let linked = LinkedList<T>()
    
    func getSize() -> Int {
        return linked.getSize()
    }
    
    func isEmpty() -> Bool {
        return linked.isEmpty()
    }
    
    func add(element: T) {
        if !linked.contains(element: element) {
           linked.addFirst (element: element)
        }
    }
    
    func remove(element: T) {
        linked.remove(element: element)
    }
    
    func contains(element: T) -> Bool {
        return linked.contains(element: element)
    }
    
}
