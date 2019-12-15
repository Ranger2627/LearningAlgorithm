//
//  HashTable.swift
//  HashCode
//
//  Created by 周一见 on 2019/12/15.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

fileprivate let upperTol = 10
fileprivate let lowrTol = 2

class HashTable<K: Hashable & Comparable, V> {
    private var treeMap: [RBTree<K, V>]
    private var M: Int
    private var size = 0
    var mIndex = 0
    
    private var MArray = [53, 97, 193, 389, 769, 1543, 3079, 6151, 12289, 24593, 49157, 98317, 196613, 393241, 786433, 1572869, 3145739, 6291469, 12582917, 25165843, 50331653, 100663319, 201326611, 402653189, 805306457, 610612741]
    
    init() {
        self.M = MArray[mIndex]
        self.treeMap = Array<RBTree<K, V>>.init(repeating: RBTree<K, V>.init(), count: M)
    }
    
    private func hash(key: K) -> Int {
        return abs(key.hashValue) % M
    }
    
    func getSize() -> Int {
        return size
    }
    
    func add(key: K, value: V?) {
        let map = self.treeMap[hash(key: key)]
        if map.contains(key: key) {
            map.set(key: key, value: value)
        } else {
            map.add(key: key, value: value)
            size += 1
            
            if (size >= upperTol * M) && (mIndex + 1 < MArray.count) {
                mIndex += 1
                resize(newM: MArray[mIndex])
            }
        }
    }
    
    func remove(key: K) -> V? {
        let map = self.treeMap[hash(key: key)]
        var value: V?
        if map.contains(key: key) {
            size -= 1
            value = map.remove(key: key)
            
            if (size <= lowrTol * M) && (mIndex - 1 >= 0) {
                mIndex -= 1
                resize(newM: MArray[mIndex])
            }
        }
        return value
    }
    
    func set(key: K, value: V?) {
        let map = self.treeMap[hash(key: key)]
        if map.contains(key: key) {
            map.set(key: key, value: value)
        } else {
            fatalError("key no exsist")
        }
    }
    
    func contains(key: K) -> Bool {
        return self.treeMap[hash(key: key)].contains(key: key)
    }
    
    func get(key: K) -> V? {
        return self.treeMap[hash(key: key)].get(key: key)
    }
    
    private func resize(newM: Int) {
        let newTreeMap = Array<RBTree<K, V>>.init(repeating: RBTree<K, V>.init(), count: newM)
        let oldM = self.M
        self.M = newM
        for i in 0..<oldM {
            let map = self.treeMap[i]
            for key in map.allKey() {
                newTreeMap[hash(key: key)].add(key: key, value: map.get(key: key))
            }
        }
    }
}

//Test
