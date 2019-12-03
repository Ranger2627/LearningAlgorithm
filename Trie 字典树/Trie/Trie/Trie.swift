//
//  Trie.swift
//  Trie
//
//  Created by 周一见 on 2019/12/1.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class Trie {
    
    private class Node {
        var isWord = false
        var next = BSTDic<Character, Node>.init()
        
        init(isWord: Bool) {
            self.isWord = isWord
        }
        
        convenience init() {
            self.init(isWord: false)
        }
    }
    
    private var root = Node()
    private var size = 0
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func add(word: String) {
        var cur = root
        for c in word {
            if cur.next.get(key: c) == nil {
                cur.next.add(key: c, value: Node())
            }
            cur = cur.next.get(key: c)!
        }
        if !cur.isWord {
            cur.isWord = true
            size += 1
        }
    }
    
    func contains(word: String) -> Bool {
        var cur: Node = root
        for c in word {
            if !cur.next.contains(key: c) {
                return false
            }
            cur = cur.next.get(key: c)!
        }
        return cur.isWord
    }
    
    func isPrefix(prefix: String) -> Bool {
        var cur: Node = root
        for c in prefix {
            if !cur.next.contains(key: c) {
                return false
            }
            cur = cur.next.get(key: c)!
        }
        return true
    }
    
    func search(word: String) -> Bool {
        return search(node: root, word: word, index: 0)
    }
    
    private func search(node: Node, word: String, index: Int) -> Bool {
        if word.count == index {
            return node.isWord
        }
        let strIndex = word.index(word.startIndex, offsetBy: index)
        let c = word[strIndex]
        if c != "." {
            if !node.next.contains(key: c) {
                return false
            }
            return search(node: node.next.get(key: c)!, word: word, index: index + 1)
        } else {
            for nextC in node.next.getAllKey() {
                if search(node: node.next.get(key: nextC)!, word: word, index: index + 1) {
                    return true
                }
            }
            return false
        }
    }
}

class Trie2 {
    private class Node {
        var value = 0
        var next = BSTDic<Character, Node>.init()
        
        init(value: Int) {
            self.value = value
        }
        
        convenience init() {
            self.init(value: 0)
        }
    }
    
    private var root = Node()
    
    func add(word: String, value: Int) {
        var cur = root
        for c in word {
            if cur.next.get(key: c) == nil {
                cur.next.add(key: c, value: Node())
            }
            cur = cur.next.get(key: c)!
        }
        cur.value = value
    }
    
    func sum(_ prefix: String) -> Int {
        var cur: Node = root
        for c in prefix {
            if !cur.next.contains(key: c) {
                return 0
            }
            cur = cur.next.get(key: c)!
        }
        return sum(node: cur)
    }
    
    private func sum(node: Node) -> Int {
        var res = node.value
        for i in node.next.getAllKey() {
            res += sum(node: node.next.get(key: i)!)
        }
        return res
    }
}
