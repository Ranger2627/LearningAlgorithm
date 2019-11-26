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
        print(testHeapTime())
        print(testHeapTime2())
    }

    func testHeapTime() -> TimeInterval {
        let start = Date().timeIntervalSince1970
        let max = 5000000
        let heap = MaxHeap<Int>.init(capacity: max)
        for _ in 0..<max {
            heap.add(element: Int.random(in: 0...max))
        }
        let end = Date().timeIntervalSince1970
        return end - start
    }
    
    func testHeapTime2() -> TimeInterval {
        let start = Date().timeIntervalSince1970
        let max = 1000000
        var arr = Array<Int>.init()
        arr.reserveCapacity(max)
        for _ in 0...max {
            arr.append(Int.random(in: 0...max))
        }
        let _ = MaxHeap<Int>.init(array: arr)
        let end = Date().timeIntervalSince1970
        return end - start
    }

}

