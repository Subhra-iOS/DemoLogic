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
        createTriangleWith(lineNo: 10)
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
    
}
