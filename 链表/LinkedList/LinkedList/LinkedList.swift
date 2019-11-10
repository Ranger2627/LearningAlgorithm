//
//  LinkedList.swift
//  LinkedList
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class LinkedList<T> {
    class Node {
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
        
        
    }
}

