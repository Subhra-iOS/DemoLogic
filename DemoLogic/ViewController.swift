//
//  ViewController.swift
//  DemoLogic
//
//  Created by Subhra Roy on 09/11/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

import UIKit

enum  B2CProductResultKey : String {
    case category = "category"
    case productItem = "productItem"
    case discountExist = "discountExist"
}

enum B2CProductCategory : String{
    case printCategory = "Print Category"
    case popularProducts = "Popular Products"
    case newArrivals = "New Arrivals"
    case recomandedProducts =  "Recomanded Products"
}

enum B2CProducts<B2CProductCategory, B2CCategoryItemType, T>{
    case productCategoryInfo(B2CProductCategory, B2CCategoryItemType, T)
    
    var details : [String : Any] {
        switch self {
        case .productCategoryInfo(let category, let item, let discountExist):
            return [B2CProductResultKey.category.rawValue : category, B2CProductResultKey.productItem.rawValue : item , B2CProductResultKey.discountExist.rawValue : discountExist]
        }
    }
}

enum  B2CCategoryItemType : Int{
    case none
    case category
    case popularProductsItem
    case newArrivalsItem
    case recomendedItem
}

extension B2CProductCategory : RawRepresentable{
   
    typealias AbsoluteValue = String
    
    init?(rawValue : AbsoluteValue) {
        switch rawValue {
            case "Print Category":  self = .printCategory
            case "Popular Products" :  self = .popularProducts
            case "New Arrivals" :  self = .newArrivals
            case  "Recomanded Products" : self = .recomandedProducts
            default : return nil
        }
    }
    
    var stringValue : AbsoluteValue {
        switch self {
            case .printCategory:
                return "Print Category"
            case .popularProducts :
                return  "Popular Products"
            case .newArrivals :
                return  "New Arrivals"
            case .recomandedProducts :
                return  "Recomanded Products"
        }
    }
    
}

protocol B2CCategoryDiscountProtocol {
    func discountAvailable() -> Bool
}

enum B2CCategoryDiscount  {
    case none
    case categoryDiscount(Bool)
}

extension  B2CCategoryDiscount : B2CCategoryDiscountProtocol{
        
    func discountAvailable() -> Bool {
        switch self {
            case .categoryDiscount(let state):
                return state
            case .none :
                return false
        }
    }
    
}


private func createNewCategory(){
    
    
    let b2cProduct1 : B2CProducts = B2CProducts.productCategoryInfo(B2CProductCategory.printCategory.stringValue, B2CCategoryItemType.category.rawValue, B2CCategoryDiscount.categoryDiscount(true).discountAvailable())
    
    print("\(b2cProduct1.details)")
    print("\(String(describing: b2cProduct1.details[B2CProductResultKey.productItem.rawValue]))")
    
    let b2cProduct2 : B2CProducts = B2CProducts.productCategoryInfo(B2CProductCategory.popularProducts.stringValue, B2CCategoryItemType.popularProductsItem.rawValue, B2CCategoryDiscount.categoryDiscount(false).discountAvailable())
       
       print("\(b2cProduct2.details)")
       print("\(String(describing: b2cProduct2.details[B2CProductResultKey.productItem.rawValue]))")
    
    let b2cProduct3 : B2CProducts = B2CProducts.productCategoryInfo(B2CProductCategory.newArrivals.stringValue, B2CCategoryItemType.newArrivalsItem.rawValue, B2CCategoryDiscount.categoryDiscount(false).discountAvailable())
       
       print("\(b2cProduct3.details)")
       print("\(String(describing: b2cProduct3.details[B2CProductResultKey.productItem.rawValue]))")
    
    let b2cProduct4 : B2CProducts = B2CProducts.productCategoryInfo(B2CProductCategory.recomandedProducts.stringValue, B2CCategoryItemType.recomendedItem.rawValue, B2CCategoryDiscount.categoryDiscount(false).discountAvailable())
       
       print("\(b2cProduct4.details)")
       print("\(String(describing: b2cProduct4.details[B2CProductResultKey.productItem.rawValue]))")
    
    let b2cProduct5 : B2CProducts = B2CProducts.productCategoryInfo(B2CProductCategory.recomandedProducts.stringValue, B2CCategoryItemType.none.rawValue, B2CCategoryDiscount.categoryDiscount(false).discountAvailable())
    
    print("\(b2cProduct5.details)")
    print("\(String(describing: b2cProduct5.details[B2CProductResultKey.productItem.rawValue]))")
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        createTriangleWith(lineNo: 10)
//        createRightfaceTriangleWith(lineNo: 10)
//        createRightfaceUpDownTriangleWith(lineNo: 10)
//        createDiamondPatternWith(lineNo: 10)
//        createPerfectTrianglePatternWith(lineNo: 10)
        
        createNewCategory()
    }

}

extension ViewController{
    func createTriangleWith(lineNo : Int) -> Void{
        var spaceStar : String = String()
        for i in 0 ..< (lineNo + 1){
            for _ in (0 ..< (lineNo - i )).reversed() {
                spaceStar = spaceStar + " "
            }
            for _ in 0 ..< i {
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
        let height = lineNo
        var spaceCount = height/2 + 1
        var count = 0
        
        for i in (1 ..< (height + 1)){
            
            if (i < (height/2 + 1)) {
                count = i * 2 - 1
                spaceCount = spaceCount - 1
            }else{
                count = (height - i) * 2 + 1
                spaceCount = spaceCount + 1
            }
            
            let spaceString =  String(repeating: " ", count: spaceCount)
           let starString =  String(repeating: "*", count: count)
           print("\(spaceString + starString)")
    
        }
     
    }
    
    func createPerfectTrianglePatternWith(lineNo : Int) -> Void{
          let height = lineNo
          var spaceCount = height/2 + 1
          let loopCount = height/2 + 1
          var count = 0
          
          for i in (1 ..< loopCount){
                count = i * 2 - 1
                spaceCount = spaceCount - 1
                let spaceString =  String(repeating: " ", count: spaceCount)
               let starString =  String(repeating: "*", count: count)
               print("\(spaceString + starString)")
          }
       
      }
    
}
