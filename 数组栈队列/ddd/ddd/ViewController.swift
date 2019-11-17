//
//  ViewController.swift
//  ddd
//
//  Created by 周一见 on 2019/11/8.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testRemove()
    }


    func test1() {
        let a = NewArray<Int>()
        for i in 0 ..< 8 {
           a.addLast(element: i)
        }
        a.add(element: 20, index: 3)
        a.add(element: 50, index: 5)
        a.add(element: 70, index: 7)

        print(a)

        let _ = a.get(index: 3)
        a.set(index: 3, element: 30)
        let number1 = a.get(index: 3)

        let _ = a.contains(element: number1)
        let _ = a.find(element: number1)

        let _ = a.removeLast()
        let _ = a.removeFirst()
        print(a)

        let removeNumber1 = a.remove(element: number1)
        print(removeNumber1)

        let arrayStack = ArrayStack<Int>.init()
        arrayStack.push(element: 1)
        arrayStack.push(element: 2)
        arrayStack.push(element: 3)
        arrayStack.push(element: 4)
        print(arrayStack)
        let _ = arrayStack.pop()
        let _ = arrayStack.pop()
        let _ = arrayStack.pop()
        let _ = arrayStack.pop()
        arrayStack.push(element: 2)
        print(arrayStack)

        let solution = Solution20()
        print(solution.isValid("[()](())"))
    }
    
    func test2() {

        let arrayQueue = ArrayQueue<Int>()
        print(testQueueTime(queue: arrayQueue, count: 100000))

        let loopQueue = LoopQueue<Int>()
        print(testQueueTime(queue: loopQueue, count: 100000))
        
        let linkedQueue = LinkedQueue<Int>()
        print(testQueueTime(queue: linkedQueue, count: 100000))
    }
    
    func testQueueTime<T: Queue>(queue: T, count: Int) -> TimeInterval where T.ItemType == Int {
        let start = Date().timeIntervalSince1970
        for i in 0 ..< count {
            queue.enqueue(element: i)
        }
        for _ in 0 ..< count {
            let _ = queue.dequeue()
        }
        let end = Date().timeIntervalSince1970
        return end - start
    }
    
    //leetCode 203
    func testRemove() {
        let array = [1, 2, 6, 3, 4, 6]
        let node = ListNode.init(array: array)
        print(node)
        
        let solution =  Solution203()
        solution.removeElements(node, 6)
        print(node)
    }
}

