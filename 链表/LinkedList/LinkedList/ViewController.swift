//
//  ViewController.swift
//  LinkedList
//
//  Created by 周一见 on 2019/11/9.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    
    func test() {
        let linkedList = LinkedList<Int>.init()
        for i in 0..<5 {
            linkedList.addFirst(element: i)
            print(linkedList)
        }
        linkedList.add(index: 2, element: 666)
        print(linkedList)
    }

}

