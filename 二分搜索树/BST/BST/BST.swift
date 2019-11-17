//
//  BST.swift
//  BST
//
//  Created by 周一见 on 2019/11/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class BST<T: Comparable> {
    private class Node {
        var element: T
        var left, right: Node?
        
        init(element: T) {
            self.element = element
            self.left = nil
            self.right = nil
        }
    }
    
    private var root: Node?
    private var size = 0
    
    func getSize() -> Int {
        return self.size
    }
    
    func isEmpty() -> Bool {
        return self.size == 0
    }
    
    //MARK: - 添加元素
    func add(element: T) {
        if root == nil {
            root = Node.init(element: element)
        } else {
            add(node: root, element: element)
        }
    }
    
    //递归添加
    private func add(node: Node?, element: T) {
        if node == nil {
            return
        }
        if element < node!.element && node!.left == nil {
            node?.left = Node.init(element: element)
            return
        }
        if element > node!.element && node?.right == nil {
            node?.right = Node.init(element: element)
            return
        }
        if element < node!.element {
            add(node: node?.left, element: element)
        } else {
            add(node: node?.right, element: element)
        }
    }
}
