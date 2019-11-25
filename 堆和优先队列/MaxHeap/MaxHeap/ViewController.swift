//
//  ViewController.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/11/25.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let max = 200000
        let a = MaxHeap<Int>.init(capacity: max)
        for _ in 0..<max {
            a.add(element: Int(arc4random()))
        }
        var b: [Int] = Array.init(repeating: 0, count: max)
        for i in 0..<max {
            b[i] = a.extractMax()
        }
        for i in 0..<(max - 1) {
            if b[i] < b[i + 1] {
                fatalError("Error")
            }
        }
        print("11")
    }


}

