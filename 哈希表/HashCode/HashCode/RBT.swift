//
//  BST.swift
//  BST
//
//  Created by 周一见 on 2019/11/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

fileprivate let red = true
fileprivate let black = true
 
class RBTree<K: Comparable, V>: MapP {
    typealias KeyType = K
    typealias ValueType = V
    
    private class Node {
        var key: K
        var value: V?
        var color: Bool
        var left, right: Node?
        
        init(key: K, value: V?) {
            self.key = key
            self.value = value
            self.color = red
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
    
    func allKey() -> [K] {
        var allKey: [K] = []
        getAllKey(node: root, array: &allKey)
        return allKey
    }
    
    private func getAllKey(node: Node?, array: inout [K]) {
        if node != nil {  
            self.getAllKey(node: node?.left, array: &array)
            array.append(node!.key)
            self.getAllKey(node: node?.right, array: &array)
        }
    }
    
    private func isRed(node: Node?) -> Bool {
        return node?.color ?? black
    }
    
    func add(key: K, value: V?) {
        let _ = add(node: root, key: key, value: value)
        root?.color = black
    }
    
    private func leftRotate(node: Node) -> Node {
        let x = node.right!
        node.right = x.left
        x.left = node
        x.color = node.color
        node.color = red
        
        return x
    }
    
    private func rightRotate(node: Node) -> Node {
        let x = node.left!
        node.left = x.right
        x.right = node
        x.color = node.color
        node.color = red
        
        return x
    }
    
    private func flipColors(node: Node) {
        node.color = red
        node.left?.color = black
        node.right?.color = black
    }
    
    //递归添加
    private func add(node: Node?, key: K, value: V?) -> Node? {
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
        var finalNode = node!
        if isRed(node: node?.right) && !isRed(node: node?.left) {
            finalNode = leftRotate(node: node!)
        }
        if isRed(node: node?.left) && isRed(node: node?.left?.left) {
            finalNode = rightRotate(node: finalNode)
        }
        if isRed(node: node?.left) && isRed(node: node?.right) {
            flipColors(node: finalNode)
        }
        return finalNode
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
    
    func set(key: K, value: V?) {
        let node = getNode(node: root, key: key)
        if node == nil {
            fatalError("key not exist")
        }
        node?.value = value
    }
    
}
