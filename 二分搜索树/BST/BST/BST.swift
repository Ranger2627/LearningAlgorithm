//
//  BST.swift
//  BST
//
//  Created by 周一见 on 2019/11/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation


class BST<T: Comparable>: CustomStringConvertible {
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
    
    //MARK: - 打印输出
    var description: String {
        var des = ""
        getBSTString(node: root, depth: 0, des: &des)
        return des
    }
    
    private func getBSTString(node: Node?, depth: Int, des: inout String) {
        if node == nil {
            des.append(getDepthString(depth: depth) + "nil\n")
            return
        }
        des.append(getDepthString(depth: depth) + "\(node!.element)\n")
        getBSTString(node: node?.left, depth: depth + 1, des: &des)
        getBSTString(node: node?.right, depth: depth + 1 , des: &des)
    }
    
    private func getDepthString(depth: Int) -> String {
        var str = ""
        for _ in 0..<depth {
            str += "--"
        }
        return str
    }
    
    func getSize() -> Int {
        return self.size
    }
    
    func isEmpty() -> Bool {
        return self.size == 0
    }
    
    //MARK: - 添加元素
    func add(element: T) {
        root = add(node: root, element: element)
    }
    
    //递归添加
    private func add(node: Node?, element: T) -> Node? {
        if node == nil {
            size += 1
            return Node.init(element: element)
        }
        if element < node!.element {
            node?.left = add(node: node?.left, element: element)
        } else if element > node!.element {
            node?.right = add(node: node?.right, element: element)
        }
        return node
    }
    
    //MAKR: - 查询元素
    func contains(element: T) -> Bool {
        contains(node: root, element: element)
    }
    
    private func contains(node: Node?, element: T) -> Bool {
        if node == nil {
            return false
        }
        if element == node!.element {
            return true
        } else if element < node!.element {
            return contains(node: node?.left, element: element)
        } else {
            return contains(node: node?.right, element: element)
        }
    }
    
    //MARK: - 遍历元素
    //前序遍历
    func preOrder() {
        preOrder(node: root)
    }
    
    private func preOrder(node: Node?) {
        if node == nil {
            return
        }
        print(node!.element)
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
    
    func preOrderNR() {
        let stack = ArrayStack<Node>.init()
        stack.push(element: root!)
        while !stack.isEmpty() {
            let cur = stack.pop()
            print(cur.element)
            if cur.right != nil {
                stack.push(element: cur.right!)
            }
            if cur.left != nil {
                stack.push(element: cur.left!)
            }   
        }
    }
    
    func cengXuOrder() {
        let queue = LoopQueue<Node>.init()
        queue.enqueue(element: root!)
        while !queue.isEmpty() {
            let cur = queue.dequeue()
            print(cur.element)
            if cur.left != nil {
                queue.enqueue(element: cur.left!)
            }
            if cur.right != nil {
                queue.enqueue(element: cur.right!)
            }
        }
    }
    
    //中序遍历
    func inOrder() {
        inOrder(node: root)
    }
    
    private func inOrder(node: Node?) {
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        print(node!.element)
        inOrder(node: node?.right)
    }
    
    //后序遍历
    func backOrder() {
        backOrder(node: root)
    }
    
    private func backOrder(node: Node?) {
        if node == nil {
            return
        }
        backOrder(node: node?.left)
        backOrder(node: node?.right)
        print(node!.element)
    }
    
}
