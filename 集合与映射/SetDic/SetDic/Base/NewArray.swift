//
//  aaa.swift
//  ddd
//
//  Created by 周一见 on 2019/11/8.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class NewArray<T>: CustomStringConvertible {
    private var data: Array<T?>
    private var size = 0
    
    //MARK: - init and description
    var description: String {
        var des = "This Array has \(size) number, \(data.count) capacity \n"
        des += "["
        for (index, i) in data.enumerated() where i != nil {
            des += "\(i!)"
            if index != (size - 1) {
                des += ", "
            }
        }
        des += "]"
        
        return des
    }
    
    init(capacity: Int) {
        data = Array<T?>.init(repeating: nil, count: capacity)
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    private func indexCheck(_ index: Int) {
        if index < 0 || index >= size {
            fatalError("Index out of range2")
        }
    }
    
    //MARK: - get and set
    func get(index: Int) -> T {
        indexCheck(index)
        return data[index]!
    }
    
    func getFirst() -> T {
        return get(index: 0)
    }
    
    func getLast() -> T {
        return get(index: size - 1)
    }
    
    func set(index: Int, element: T) {
        indexCheck(index)
        data[index] = element
    }
    
    func getSize() -> Int {
        return size
    }
    
    func getCapacity() -> Int {
        return data.count
    }
    
    //MARK: - 判断数组情况
    func isEmpty() -> Bool {
        return size == 0
    }
    

    
    //MARK: - 插入元素
    func addLast(element: T) {
        add(element: element, index: size)
    }
    
    func add(element: T, index: Int) {
        if index < 0 || index > size {
            fatalError("Index out of range3")
        } else {
            if size == data.count {
                resize(capacity: size * 2)
            }
            for i in (index ..< size).reversed() {
                data[i + 1] = data[i]
            }
            data[index] = element
            size += 1
        }
    }
    
    //MARK: - 删除元素
    func remove(index: Int) -> T {
        indexCheck(index)
        if size == (data.count / 4) && data.count > 5 {
            resize(capacity: data.count / 2)
        }
        let element = data[index]!
        for i in index ..< size {
            data[i] = data[i + 1]
        }
        data[size - 1] = nil
        size -= 1
        return element
    }
    
    func removeFirst() -> T {
        return remove(index: 0)
    }
    
    func removeLast() -> T {
        return remove(index: size - 1)
    }
    
    //MARK: - resize 数组大小
    private func resize(capacity: Int) {
        var newData = Array<T?>.init(repeating: nil, count: capacity)
        for i in 0 ..< size {
            newData[i] = data[i]
        }
        data = newData
    }
}

extension NewArray where T: Equatable {
    func contains(element:T) -> Bool {
        for i in data where i != nil {
            if i! == element {
                return true
            }
        }
        return false
    }
    
    func find(element: T) -> Int? {
        for (index, i) in data.enumerated() where i != nil {
            if i! == element {
                return index
            }
        }
        return nil
    }
    
    func remove(element: T) -> Bool {
        if let index = find(element: element) {
            let _ = remove(index: index)
            return true
        } else {
            return false
        }
    }
}

