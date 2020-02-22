//
//  Learning_SwiftTests.swift
//  Learning SwiftTests
//
//  Created by Rodney Amor on 2/21/20.
//  Copyright © 2020 Rodney Amor. All rights reserved.
//

import Foundation
import XCTest
@testable import LearningSwift

class LearningSwiftTests: XCTestCase {
    
    func testIntsPractice() {
        let p = PractingSwift()
        XCTAssertTrue(p.addInts(firstNum: 2, secondNum: 2) == 4)
        //variable parameters
        XCTAssertTrue(p.addMultipleInts(nums: 1, 2, 3, 4, 5) == 15)
        //external variable name
        XCTAssertTrue(p.subInts(numOne: 2, numTwo: 2) == 0)
        var num = 2
        //inout
        p.squareInts(num: &num)
        print("The value of num is \(num)")
        XCTAssertTrue(p.multInts(function: p.multIntsAux(num: 2), count: 2) == 4)
        //extension test
        XCTAssertTrue(num.isEven())
        
    }
    
    func testArrayPractice() {
        var sortedArr = [Int]();
        sortedArr.append(3);
        sortedArr.append(1);
        sortedArr.append(2);
        sortedArr.append(4);
        sortedArr.append(5);
        
        //sorting throught closures
        //sortedArr.sort {(numOne: Int, numTwo: Int) -> Bool in numOne < numTwo}
        //sortedArr.sort {(numOne, numTwo) in numOne < numTwo}
        sortedArr.sort {$0 < $1}
        for elem in sortedArr {
            print(elem, terminator: ", ")
        }
        
        //Any
        let anyArr: [Any] = [1, 2, "3", 4.4, Dog(name: "unk", age: 0)]
        for elem in anyArr {
            switch elem {
            case is Int:
                print("\(elem) is an Int")
            case is String:
                print("\(elem) is an String")
            case is Double:
                print("\(elem) is an Double")
            default:
                print("unidentified value")
            }
        }
        
        //AnyObject
        let anyObjectArr: [AnyObject] = [1 as AnyObject, 2 as AnyObject, "Three" as AnyObject, 4.4 as AnyObject, Dog(name: "unk", age: 0) as AnyObject]
        for elem in anyObjectArr {
            print(elem)
        }
    }

    enum Compass: String, CaseIterable, Error {
        case North
        case West
        case East
        case South
        case Other
    }
    
    func testEnumPractice() {
        XCTAssertTrue(Compass.North.rawValue == "North")
        //needs CaseIterable protocol to work
        XCTAssertTrue(Compass.allCases.count == 4)
        for elem in Compass.allCases {
            print(elem.rawValue, terminator: ", ")
        }
    }
    
    func testProtocolsAndHashable() throws {
        var mattie = Dog(name: "Mattie", age: 5)
        var tiny = Dog(name: "Tiny", age: 5)
        /*
        do {
            try mattie = Dog(name: "Mattie", age: 5)
            try tiny = Dog(name: "Tiny", age: 5)
        } catch _ {
            mattie = nil
        }*/
        
        XCTAssertFalse(mattie == tiny)
        let goodGirl = ShihTzu(n: "Tiny", a: 5)
        /*
        do {
            try goodGirl = ShihTzu(n: "Tiny", a: 5)
            
        } catch _ {
            goodGirl = nil
        }*/
        XCTAssertTrue(goodGirl.isGoodGirl())
        
        //casting
        XCTAssertTrue(goodGirl is Dog)
        if let dog = goodGirl as? Dog {
            print(dog.printName())
        }
        
        
    }

}
