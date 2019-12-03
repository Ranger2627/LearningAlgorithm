//
//  SegmentTree.swift
//  SegmentTree
//
//  Created by 周一见 on 2019/11/27.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

protocol Merge {
    static func merge(lhs: Self, rhs: Self) -> Self
}

class SegmentTree<T: Merge>: CustomStringConvertible {
    var description: String {
        var des = ""
        des += "["
        for (index, i) in tree.enumerated() {
            if i != nil {
                des += "\(i!)"
            } else {
                des += "nil"
            }
            if index != (tree.count - 1) {
                des += ", "
            }
        }
        des += "]"
        return des
    }
    
    typealias ItemType = T
    private let data: Array<T>
    private var tree: Array<T?>
    
    init(array: Array<T>) {
        self.data = array
        self.tree = Array<T?>.init(repeating: nil, count: array.count * 4)
        self.buildSegmentTree(treeIndex: 0, left: 0, right: data.count - 1)
    }
    
    private func buildSegmentTree(treeIndex: Int, left: Int, right: Int) {
        if left == right {
            tree[treeIndex] = data[left]
            return
        }
        let leftChild = self.leftChild(index: treeIndex)
        let rightChild = self.rightChild(index: treeIndex)
        let mid = (right - left) / 2 + left
        buildSegmentTree(treeIndex: leftChild, left: left, right: mid)
        buildSegmentTree(treeIndex: rightChild, left: mid + 1, right: right)
        
        tree[treeIndex] = T.merge(lhs: tree[leftChild]!, rhs: tree[rightChild]!)
    }
    
    func query(queryL: Int, queryR: Int) -> T {
        if queryL > queryR {
            fatalError("index error")
        }
        if queryL < 0 {
            fatalError("index error")
        }
        if queryR >= getSize() {
            fatalError("index error")
        }
        return query(treeIndex: 0, left: 0, right: getSize() - 1, queryL: queryL, queryR: queryR)
    }
    
    private func query(treeIndex: Int, left: Int, right: Int, queryL: Int, queryR: Int) -> T {
        if left == queryL && right == queryR {
            return tree[treeIndex]!
        }
        let leftChild = self.leftChild(index: treeIndex)
        let rightChild = self.rightChild(index: treeIndex)
        let mid = left + (right - left) / 2
        if queryL > mid {
            return query(treeIndex: rightChild, left: mid + 1, right: right, queryL: queryL, queryR: queryR)
        } else if queryR <= mid {
            return query(treeIndex: leftChild, left: left, right: mid, queryL: queryL, queryR: queryR)
        }
        let leftTree = query(treeIndex: leftChild, left: left, right: mid, queryL: queryL, queryR: mid)
        let rightTree = query(treeIndex: rightChild, left: mid + 1, right: right, queryL: mid + 1, queryR: queryR)
        return T.merge(lhs: leftTree, rhs: rightTree)
    }
    
    func getSize() -> Int {
        return data.count
    }
    
    func get(index: Int) -> T {
        if index < 0 || index >= getSize() - 1 {
            fatalError("SegmentTree index out of range!")
        }
        return data[index]
    }
    
    private func leftChild(index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChild(index: Int) -> Int {
        return index * 2 + 2
    }
    
}
