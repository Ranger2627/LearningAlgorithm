//
//  AVLMap.swift
//  AVLTree
//
//  Created by 周一见 on 2019/12/8.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class AVLmap<K: Comparable, V>: MapP {
    
    typealias KeyType = K
    
    typealias ValueType = V
    
    private let avlTree = AVLDic<K, V>.init()
    
    func getSize() -> Int {
        return avlTree.getSize()
    }
    
    func isEmpty() -> Bool {
        return avlTree.isEmpty()
    }
    
    func add(key: K, value: V?) {
        avlTree.add(key: key, value: value)
    }
    
    func remove(key: K) -> V? {
        return avlTree.remove(key: key)
    }
    
    func contains(key: K) -> Bool {
        return avlTree.contains(key: key)
    }
    
    func get(key: K) -> V? {
        return avlTree.get(key: key)
    }
    
    func set(key: K, value: V) {
        avlTree.set(key: key, value: value)
    }
    
}

class AVLSet<K: Comparable>: SetP {
    func getSize() -> Int {
        return avlTree.getSize()
    }
    
    func isEmpty() -> Bool {
        return avlTree.isEmpty()
    }
    
    func add(element: K) {
        avlTree.add(key: element, value: nil)
    }
    
    func remove(element: K) {
        let _ = avlTree.remove(key: element)
    }
    
    func contains(element: K) -> Bool {
        return avlTree.contains(key: element)
    }
    
    typealias ItemType = K
    private let avlTree = AVLDic<K, Any>.init()
    
    
    
}
