//
//  Practice.swift
//  Learning Swift
//
//  Created by Rodney Amor on 2/21/20.
//  Copyright © 2020 Rodney Amor. All rights reserved.
//

import Foundation

class PractingSwift {

    func addInts(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
    
    //variable parameters practice
    func addMultipleInts(nums: Int...) -> Int{
        var total = 0
        for val in nums {
            total += val
        }
        return total
    }
    
    //external name practice
    func subInts(numOne firstNum: Int, numTwo secondNum: Int) -> Int {
        return firstNum - secondNum
    }
    
    //inout practice
    func squareInts(num: inout Int) {
        num *= num
    }
    
    //takes in a function as parameter
    func multInts(function: (Int), count: Int) -> Int {
        var total = 0
        for _ in 0..<count {
            total += function
        }
        return total
    }
    
    func multIntsAux(num: Int) -> Int {
        return num
    }
    
}

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

//protocols and hashable
protocol Animal {
    var name: String { get set }
    var age: Int { get set }
    
    
}

class Dog: Animal, Hashable {
    var name: String
    var age: Int
    var hashValue: Int {
        return name.hashValue
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func ==(first: Dog, second: Dog) -> Bool {
        return first.hashValue == second.hashValue
    }
    
    func printName() -> String {
        return name
    }
}

class ShihTzu: Dog {
    var goodGirl: Bool
    
    init(n: String, a: Int) {
        goodGirl = true
        super.init(name: n, age: a)
    }
    
    func isGoodGirl() -> Bool {
        return goodGirl
    }
}


