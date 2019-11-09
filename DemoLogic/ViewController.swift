//
//  ViewController.swift
//  DemoLogic
//
//  Created by Subhra Roy on 09/11/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        createTriangleWith(lineNo: 10)
//        createRightfaceTriangleWith(lineNo: 10)
//        createRightfaceUpDownTriangleWith(lineNo: 10)
        createDiamondPatternWith(lineNo: 5)
    }

}

extension ViewController{
    func createTriangleWith(lineNo : Int) -> Void{
        var spaceStar : String = String()
        for i in 0 ... lineNo{
            for _ in (0 ..< lineNo - i ).reversed() {
                spaceStar = spaceStar + " "
            }
            for _ in 0 ... i {
                spaceStar = spaceStar + "*"
            }
            spaceStar = spaceStar + "\n"
        }
        
        print("\(spaceStar)")
    }
    
    func createRightfaceTriangleWith(lineNo : Int) -> Void{
        
        var spaceStar : String = String()
        for i in 0 ... lineNo{
            for _ in 0 ... i{
                spaceStar = spaceStar + "*"
            }
            spaceStar = spaceStar + "\n"
        }
        
        print("\(spaceStar)")
        
    }
    
    func createRightfaceUpDownTriangleWith(lineNo : Int) -> Void{
        
        var spaceStar : String = String()
        for i in 0 ... lineNo{
            for _ in 0 ... i{
                spaceStar = spaceStar + "*"
            }
            spaceStar = spaceStar + "\n"
        }
        for i in (0 ... lineNo).reversed(){
           for _ in 0 ... i{
               spaceStar = spaceStar + "*"
           }
           spaceStar = spaceStar + "\n"
       }
        
        print("\(spaceStar)")
        
    }
    
    func createDiamondPatternWith(lineNo : Int) -> Void{
        var spaceString : String = String()
        for i in 1 ..< lineNo{
            let spaceCount = (lineNo - i)/2
            spaceString = spaceString + String(repeating: " ", count: spaceCount)
            let count = (i - 1) * 2 + 1
            spaceString = spaceString + String(repeating: "*", count: count)
            spaceString = spaceString + "\n"
        }
        for i in (1 ... lineNo - 1).reversed(){
            let spaceCount = i / 2
            spaceString = spaceString + String(repeating: " ", count: spaceCount)
           let count = (i + 1)
           spaceString = spaceString + String(repeating: "*", count: count)
            spaceString = spaceString + "\n"
       }
        print("\(spaceString)")
    }
    
}
