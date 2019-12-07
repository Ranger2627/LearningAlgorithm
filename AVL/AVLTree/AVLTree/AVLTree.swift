//
//  AVLTree.swift
//  AVLTree
//
//  Created by 周一见 on 2019/12/7.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

protocol MapP {
    associatedtype KeyType: Comparable
    associatedtype ValueType
    
    func getSize() -> Int
    func isEmpty() -> Bool
    func add(key: KeyType, value: ValueType)
    func remove(key: KeyType) -> ValueType?
    func contains(key: KeyType) -> Bool
    func get(key: KeyType) -> ValueType?
    func set(key: KeyType, value: ValueType)
}


class AVLDic<K: Comparable, V>: MapP {
    typealias KeyType = K
    typealias ValueType = V
    
    private class Node {
        var key: K
        var value: V?
        var height: Int
        var left, right: Node?
        
        init(key: K, value: V?) {
            self.key = key
            self.value = value
            self.height = 1
            self.left = nil
            self.right = nil
        }
    }
    
    private var root: Node?
    private var size = 0
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isBST() -> Bool {
        var keys = Array<K>.init()
        inOrder(node: root, array: &keys)
        for (index, _) in keys.enumerated() {
            if index < (keys.count - 1) {
                if keys[index] > keys[index + 1] {
                    return false
                }
            }
        }
        return true
    }
    
    private func inOrder(node: Node?, array: inout [K]) {
        if node != nil {
            inOrder(node: node?.left, array: &array)
            array.append(node!.key)
            inOrder(node: node?.right, array: &array)
        }
    }
    
    func isBalanced() -> Bool {
        return isBalanced(node: root)
    }
    
    private func isBalanced(node: Node?) -> Bool {
        if node == nil {
            return true
        } else {
            if getBalanceFator(node: node) > 1 {
                return false
            } else {
                return isBalanced(node: node?.left) && isBalanced(node: node?.right)
            }
        }
    }
    
    private func getHeight(node: Node?) -> Int {
        return node?.height ?? 0
    }
    
    func add(key: K, value: V) {
        let _ = add(node: root, key: key, value: value)
    }
    
    private func rightRotate(y: Node?) -> Node? {
        let x = y?.left
        let t3 = x?.right
        
        x?.right = y
        y?.left = t3
        
        y?.height = max(getHeight(node: y?.left), getHeight(node: y?.right)) + 1
        x?.height = max(getHeight(node: x?.left), getHeight(node: x?.right)) + 1
        
        return x
    }
    
    private func leftRotate(y: Node?) -> Node? {
           let x = y?.right
           let t3 = x?.left
           
           x?.left = y
           y?.right = t3
           
           y?.height = max(getHeight(node: y?.left), getHeight(node: y?.right)) + 1
           x?.height = max(getHeight(node: x?.left), getHeight(node: x?.right)) + 1
           
           return x
    }
    //递归添加
    private func add(node: Node?, key: K, value: V) -> Node? {
        if node == nil {
            size += 1
            return Node.init(key: key, value: value)
        }
        if key < node!.key {
            node?.left = add(node: node?.left, key: key, value: value)
        } else if key > node!.key {
            node?.right = add(node: node?.right, key: key, value: value)
        } else {
            node?.value = value
        }
        
        node?.height = 1 + max(getHeight(node: node?.left), getHeight(node: node?.right))
        let balanceFator = getBalanceFator(node: node)
        if balanceFator > 1  {
            if getBalanceFator(node: node?.left) >= 0 {
               return rightRotate(y: node)
            } else {
                node?.left = leftRotate(y: node?.left)
                return rightRotate(y: node)
            }
        } else if balanceFator < -1 {
            if getBalanceFator(node: node?.right) <= 0 {
                return leftRotate(y: node)
            } else {
                node?.right = leftRotate(y: node?.right)
                return leftRotate(y: node)
            }
        }
         
        return node
    }
    
    private func getBalanceFator(node: Node?) -> Int {
        return getHeight(node: node?.left) - getHeight(node: node?.right)
    }
    
    private func getNode(node: Node?, key: K) -> Node? {
        if node == nil {
            return nil
        }
        if node!.key == key {
            return node
        }
        if key < node!.key {
            return getNode(node: node?.left, key: key)
        } else {
            return getNode(node: node?.right, key: key)
        }
    }
    
    private func minimum(node: Node?) -> Node? {
        if node?.left == nil {
            return node
        }
        return minimum(node: node?.left)
    }
    
    private func removeMin(node: Node?) -> Node? {
        if node?.left == nil {
            let node = node?.right
            node?.right = nil
            size -= 1
            return node?.right
        }
        node?.left = removeMin(node: node?.left)
        return node
    }
    
    func remove(key: K) -> V? {
        let node = getNode(node: root, key: key)
        if node != nil {
            root = remove(node: root, key: key)
        }
        return node?.value
    }
    
    private func remove(node: Node?, key: K) -> Node? {
        if node == nil {
            return nil
        }
        if key < node!.key {
            node?.left = remove(node: node?.left, key: key)
            return node
        }
        if key > node!.key {
            node?.right = remove(node: node?.right, key: key)
            return node
        }
        if node?.left == nil {
            let node = node?.right
            node?.right = nil
            size -= 1
            return node?.right
        }
        if node?.right == nil {
            let node = node?.left
            node?.left = nil
            size -= 1
            return node?.left
        }
        let suss = minimum(node: node?.right)
        let min = removeMin(node: node?.right)
        suss?.right = min
        suss?.left = node?.left
        node?.left = nil
        node?.right = nil
        return node
    }
    
    func contains(key: K) -> Bool {
        return getNode(node: root, key: key) != nil
    }
    
    func get(key: K) -> V? {
        return getNode(node: root, key: key)?.value
    }
    
    func set(key: K, value: V) {
        let node = getNode(node: root, key: key)
        if node == nil {
            fatalError("key not exist")
        }
        node?.value = value
    }
    
}
