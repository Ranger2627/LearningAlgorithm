//
//  LeetCode20.swift
//  ddd
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class Solution20 {
    func isValid(_ s: String) -> Bool {
        let stack = ArrayStack<Character>.init()
        for c in s {
            if c == "(" || c == "[" || c == "{" {
                stack.push(element: c)
            } else {
                if stack.isEmpty() {
                    return false
                }
                let lc = stack.pop()
                if lc == "(" && c != ")" {
                    return false
                }
                if lc == "[" && c != "]" {
                    return false
                }
                if lc == "{" && c != "}" {
                    return false
                }
            }
            
        }
        
        return stack.isEmpty()
    }
}
