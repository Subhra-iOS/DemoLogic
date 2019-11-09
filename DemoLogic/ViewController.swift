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
        var spaceCount = lineNo/2 + 1
        var count = 0
        
        for i in (1 ..< (lineNo + 1)){
            
            if (i <= (lineNo/2 + 1)) {
                count = i * 2 - 1
                spaceCount = spaceCount - 1
            }else{
                count = (lineNo - i) * 2 + 1
                spaceCount = spaceCount + 1
            }
            
        }
       
        let spaceString =  String(repeating: " ", count: spaceCount)
        let starString =  String(repeating: "*", count: count)
        print("\(spaceString + starString)")
        
       /* var height = lineNo
        var spaceCount = height / 2 + 1

        for row in (1 ..< height + 1) {
          var starCount = 0
          
          if (row <= (height / 2  + 1) ) {
            starCount  = row * 2 - 1
            spaceCount -= 1
          } else {
            starCount  = (height - row) * 2 + 1
            spaceCount += 1
          }
          let spaceInFront = String(repeating: " ", count: spaceCount);
          let stars = String(repeating: "*", count: starCount);
          print(spaceInFront + stars)
        }*/
    }
    
}
