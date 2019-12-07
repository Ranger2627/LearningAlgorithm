//
//  Protocal.swift
//  UnionFind
//
//  Created by 周一见 on 2019/12/4.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

protocol UF {
    func getSzie() -> Int
    func isConnect(p: Int, q: Int) -> Bool
    func unionElemnts(p: Int, q: Int)
}
