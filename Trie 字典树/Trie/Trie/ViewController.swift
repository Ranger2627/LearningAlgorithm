//
//  ViewController.swift
//  Trie
//
//  Created by 周一见 on 2019/12/1.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = Trie()
        a.add(word: "ddd")
        a.add(word: "yeyu")
        print( a.search(word: "d.d"))
    }


}

