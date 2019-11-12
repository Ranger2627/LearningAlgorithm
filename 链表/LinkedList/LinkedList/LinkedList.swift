//
//  LinkedList.swift
//  LinkedList
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class LinkedList<T>: CustomStringConvertible {
    //MARK: - 私有成员
    private class Node: CustomStringConvertible {
        var node: T?
        var next: Node?
        
        init(element: T?, next: Node?) {
            self.node = element
            self.next = next
        }
        
        convenience init(element: T?) {
            self.init(element: element, next: nil)
        }
        
        convenience init() {
            self.init(element: nil, next: nil)
        }
        
        var description: String {
            return node.debugDescription
        }
    }
    
    private var dummyHead: Node?
    private var size = 0
    
    //MARK: - 初始化、获取链表大小
    init() {
        dummyHead = Node.init()
    }
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    //MARK: - 添加元素
    func add(index: Int, element: T?) {
        if index < 0 || index > size {
            fatalError("Index out of range in add LinkeList")
        }
        var pre = dummyHead
        for _ in 0 ..< index {
            pre = pre?.next
        }
        pre?.next = Node.init(element: element, next: pre?.next)
        size += 1
    }
    
    func addFirst(element: T?) {
        add(index: 0, element: element)
    }
    
    func addLast(element: T?) {
        add(index: size, element: element)
    }
    
    //MARK: - 查找元素
    func get(index: Int) -> T? {
        if index < 0 || index >= size {
            fatalError("Index out of range in get LinkeList")
        }
        var current = dummyHead?.next
        for _ in 0 ..< index {
            current = current?.next
        }
        return current?.node
    }
    
    func getFirst() -> T? {
        return get(index: 0)
    }
    
    func getLast() -> T? {
        return get(index: size - 1)
    }
    
    //MARK: - 修改元素
    func set(index: Int, element: T?) {
        if index < 0 || index >= size {
            fatalError("Index out of range in set LinkeList")
        }
        var current = dummyHead?.next
        for _ in 0 ..< index {
            current = current?.next
        }
        current?.node = element
    }
    
    func setFirst(element: T?) {
        set(index: 0, element: element)
    }
    
    func setLast(element: T?) {
        set(index: size - 1, element: element)
    }
    
    //MARK: - 删除元素
    func remove(index: Int) -> T? {
        if index < 0 || index >= size {
            fatalError("Index out of range in set LinkeList")
        }
        var pre = dummyHead
        for _ in 0 ..< index {
            pre = pre?.next
        }
        let deleteNode = pre?.next
        pre?.next = deleteNode?.next
        deleteNode?.next = nil
        size -= 1
        return deleteNode?.node
    }
    
    func removeFirst() -> T? {
        return remove(index: 0)
    }
    
    func removeLast() -> T? {
        return remove(index: size - 1)
    }
    
    
    //MARK: - 打印
    var description: String {
        var des = ""
        var current = dummyHead?.next
        while current != nil {
            des = des + String(describing: current!.node!) + "->"
            current = current?.next
        }
        des += "nil"
        return des
    }
    
}

