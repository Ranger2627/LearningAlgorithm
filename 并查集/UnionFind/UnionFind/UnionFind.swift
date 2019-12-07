//
//  QuickUnion.swift
//  UnionFind
//
//  Created by 周一见 on 2019/12/4.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class SlowUnion: UF {
    private var data: [Int]
    init(size: Int) {
        data = Array.init(repeating: 0, count: size)
        for (index, _) in data.enumerated() {
            data[index] = index
        }
    }
    func getSzie() -> Int {
        return data.count
    }
    
    func isConnect(p: Int, q: Int) -> Bool {
        return data[p] == data[q]
    }
    
    func unionElemnts(p: Int, q: Int) {
        if data[p] != data[q] {
            for (index, i) in data.enumerated() {
                if i == data[p] {
                    data[index] = data[p]
                }
            }
        }
    }
}

class NormalUnion: UF {
    private var data: [Int]
    
    init(size: Int) {
        data = Array.init(repeating: 0, count: size)
        for (index, _) in data.enumerated() {
            data[index] = index
        }
    }
    
    func getSzie() -> Int {
        return data.count
    }
    
    private func find(_ p: Int) -> Int {
        var i = p
        while data[i] != i {
            i = data[i]
        }
        return i
    }
    
    func isConnect(p: Int, q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func unionElemnts(p: Int, q: Int) {
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            data[pRoot] = qRoot
        }
    }
}

class SizeUnion: UF {
    private var data: [Int]
    private var size: [Int]
    
    init(size: Int) {
        self.data = Array.init(repeating: 0, count: size)
        self.size = Array.init(repeating: 1, count: size)
        for (index, _) in data.enumerated() {
            self.data[index] = index
        }
    }
    
    func getSzie() -> Int {
        return data.count
    }
    
    private func find(_ p: Int) -> Int {
        var i = p
        while data[i] != i {
            i = data[i]
        }
        return i
    }
    
    func isConnect(p: Int, q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func unionElemnts(p: Int, q: Int) {
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            if size[pRoot] < size[qRoot] {
                data[pRoot] = qRoot
                size[qRoot] += size[pRoot]
            } else {
                data[qRoot] = pRoot
                size[pRoot] += size[qRoot]
            }
        }
    }
}

class RankUnion: UF {
    private var data: [Int]
    private var rank: [Int]
    
    init(size: Int) {
        self.data = Array.init(repeating: 0, count: size)
        self.rank = Array.init(repeating: 1, count: size)
        for (index, _) in data.enumerated() {
            self.data[index] = index
        }
    }
    
    func getSzie() -> Int {
        return data.count
    }
    
    private func find(_ p: Int) -> Int {
        var i = p
        while data[i] != i {
            i = data[i]
        }
        return i
    }
    
    func isConnect(p: Int, q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func unionElemnts(p: Int, q: Int) {
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            if rank[pRoot] < rank[qRoot] {
                data[pRoot] = qRoot
            } else if rank[pRoot] > rank[qRoot] {
                data[qRoot] = pRoot
            } else {
                data[pRoot] = qRoot
                rank[qRoot] += 1
            }
        }
    }
}

class LuJingUnion: UF {
    private var data: [Int]
    private var rank: [Int]
    
    init(size: Int) {
        self.data = Array.init(repeating: 0, count: size)
        self.rank = Array.init(repeating: 1, count: size)
        for (index, _) in data.enumerated() {
            self.data[index] = index
        }
    }
    
    func getSzie() -> Int {
        return data.count
    }
    
    private func find(_ p: Int) -> Int {
        if p < 0 || p >= data.count {
            fatalError("error")
        }
        var i = p
        while data[i] != i {
            data[i] = data[data[i]]
            i = data[i]
        }
        return i
    }
    
    func isConnect(p: Int, q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func unionElemnts(p: Int, q: Int) {
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            if rank[pRoot] < rank[qRoot] {
                data[pRoot] = qRoot
            } else if rank[pRoot] > rank[qRoot] {
                data[qRoot] = pRoot
            } else {
                data[pRoot] = qRoot
                rank[qRoot] += 1
            }
        }
    }
}


