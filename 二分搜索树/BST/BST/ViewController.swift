//
//  ViewController.swift
//  BST
//
//  Created by 周一见 on 2019/11/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        forInBST()
    }
    
    func forInBST() {
        let array = [5, 3, 6, 8, 4, 2, 50, 10, 25, 69, 159, 258, 55]
        let bst = BST<Int>.init()
        for i in array {
            bst.add(element: i)
        }
        print(bst)
        let _ = bst.removeMax()
        print(bst)
        let _ = bst.removeMin()
        print(bst)
        bst.remove(element: 25)
        print(bst)
    }

}

