//
//  Dic.swift
//  SetDic
//
//  Created by 周一见 on 2019/11/23.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class LikedListDic<K: Comparable, V>: MapP {

    typealias KeyType = K
    typealias ValueType = V
    
    private class Node: CustomStringConvertible {
        var key: K?
        var value: V?
        var next: Node?
        
        init(key: K?, value: V?, next: Node?) {
            self.key = key
            self.value = value
            self.next = next
        }
        
        convenience init(key: K?) {
            self.init(key: key, value: nil, next: nil)
        }

        convenience init() {
            self.init(key: nil)
        }
        
        var description: String {
            return key.debugDescription + ": " + value.debugDescription
        }
    }
    
    private var dummyHead: Node?
    private var size = 0
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    private func getNode(key: K) -> Node? {
        var cur = dummyHead?.next
        while cur != nil {
            if cur?.key == key {
                return cur
            }
            cur = cur?.next
        }
        return nil
    }
    
    func contains(key: K) -> Bool {
        return getNode(key: key) != nil
    }
    
    func get(key: K) -> V? {
        let node = getNode(key: key)
        return node?.value
    }
    
    func add(key: K, value: V) {
        let node = getNode(key: key)
        if node == nil {
            dummyHead?.next = Node.init(key: key, value: value, next: dummyHead?.next)
        } else {
            node?.value = value
        }
    }
    
    func set(key: K, value: V) {
        let node = getNode(key: key)
        if node == nil {
            fatalError("No key")
        } else {
            node?.value = value
        }
    }
    
    func remove(key: K) -> V? {
        var cur = dummyHead?.next
        var pre = dummyHead
        while cur != nil {
            if cur?.key == key {
                pre?.next = cur?.next
                cur?.next = nil
                return cur?.value
            }
            pre = cur
            cur = cur?.next
        }
        return nil
    }
    
}

class BSTDic<K: Comparable & Hashable, V>: MapP {
    typealias KeyType = K
    typealias ValueType = V
    
    private class Node {
        var key: K
        var value: V?
        var left, right: Node?
        
        init(key: K, value: V?) {
            self.key = key
            self.value = value
            self.left = nil
            self.right = nil
        }
    }
    
    private var root: Node?
    private var size = 0
    private var allKey: Set<K> = []
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func getAllKey() -> Set<K> {
        return allKey
    }
    
    func add(key: K, value: V) {
        root = add(node: root, key: key, value: value)
        allKey.insert(key)
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
        return node
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
        allKey.remove(key)
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
