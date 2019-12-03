//
//  ViewController.swift
//  SegmentTree
//
//  Created by 周一见 on 2019/11/27.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = [-2, 0, 3, -5, 2, -1]
        let b = SegmentTree<Int>.init(array: a)
        print(b)
        let c = b.query(queryL: 2, queryR: 5)
        print(c)
        let d = b.query(queryL: 0, queryR: 5)
        print(d)
        let e = b.query(queryL: 0, queryR: 3)
        print(e)
        
    }


}

extension Int: Merge {
    static func merge(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
}
