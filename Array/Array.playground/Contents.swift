import UIKit

class NewArray {
    private var data: Array<Int?>
    private var size: Int
    
    init(capacity: Int) {
        data = Array<Int?>.init()
        data.reserveCapacity(capacity)
        size = 0
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    func getSize() -> Int {
        return size
    }
    
    func getCapacity() -> Int {
        return data.capacity
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }

    func addLast(number: Int) {
        add(number: number, index: size)
    }
    
    func add(number: Int, index: Int) {
        if size == data.capacity {
            data.reserveCapacity(data.capacity * 2)
        }
        
        if index < 0 || index > size {
            fatalError("Index out of range")
        } else {
            data.append(nil)
            for i in (index ..< size).reversed() {
                data[i + 1] = data[i]
            }
            data[index] = number
            size += 1
        }
    }
    
    func getArray() -> [Int?] {
        return self.data
    }
}

let a = NewArray()
for i in 0 ..< 8 {
   a.addLast(number: i)
}
a.add(number: 20, index: 3)
a.add(number: 50, index: 5)
a.add(number: 70, index: 7)

print(a.getArray())





