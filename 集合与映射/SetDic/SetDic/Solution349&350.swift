//
//  Solution349&350.swift
//  SetDic
//
//  Created by 周一见 on 2019/11/24.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class Solution349 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set = Set<Int>()
        for i in nums1 {
            set.insert(i)
        }
        var jiaoJi = Array<Int>()
        for i in nums2 {
            if set.contains(i) {
                jiaoJi.append(i)
                set.remove(i)
            }
        }
        return jiaoJi
    }
}

class Solution350 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic = Dictionary<Int, Int>()
        for i in nums1 {
            dic[i, default: 0] += 1
        }
        var jiaoJi = Array<Int>()
        for i in nums2 {
            if dic[i] != nil {
                jiaoJi.append(i)
                dic[i]! -= 1
                if dic[i]! == 0 {
                    dic.removeValue(forKey: i)
                }
            }
        }
        return jiaoJi
    }
}
