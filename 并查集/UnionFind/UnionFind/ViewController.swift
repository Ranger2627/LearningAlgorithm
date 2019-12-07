//
//  ViewController.swift
//  UnionFind
//
//  Created by 周一见 on 2019/12/4.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let size = 50000
        let m = 50000
        
//        let uf1 = SlowUnion.init(size: size)
//        print(test(uf: uf1, m: m))
        
//        let uf2 = NormalUnion.init(size: size)
//        print(test(uf: uf2, m: m))
        
//        let uf3 = SizeUnion.init(size: size)
//        print(test(uf: uf3, m: m))
        
        let uf4 = RankUnion.init(size: size)
        print(test(uf: uf4, m: m))
        
        let uf5 = LuJingUnion.init(size: size)
        print(test(uf: uf5, m: m))
        
    }


    func test(uf: UF, m: Int) -> TimeInterval {
        let start = Date().timeIntervalSince1970
        let size = uf.getSzie()
        for _ in 0..<m {
            let a = Int.random(in: 0..<size)
            let b = Int.random(in: 0..<size)
            uf.unionElemnts(p: a, q: b)
        }
        
        for _ in 0..<m {
            let a = Int.random(in: 0..<size)
            let b = Int.random(in: 0..<size)
            let _ = uf.isConnect(p: a, q: b)
        }
     
        let end = Date().timeIntervalSince1970
        return end - start
    }
}

