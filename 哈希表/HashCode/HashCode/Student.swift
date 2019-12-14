//
//  Student.swift
//  HashCode
//
//  Created by 周一见 on 2019/12/14.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

class Student: Hashable {
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.grade == rhs.grade && lhs.cls == rhs.cls && lhs.firstName.lowercased() == rhs.firstName.lowercased() && lhs.lastName.lowercased() == rhs.lastName.lowercased()
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.grade)
        hasher.combine(self.cls)
        hasher.combine(self.firstName)
        hasher.combine(self.lastName)
    }
    
    var grade: Int
    var cls: Int
    var firstName: String
    var lastName: String
    
    init(grade: Int, cls: Int, firstName: String, lastName: String) {
        self.grade = grade
        self.cls = cls
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
}
