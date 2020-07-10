//
//  JsonCodableModelClass.swift
//  DemoLogic
//
//  Created by Subhra Roy on 10/07/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation

enum  AuthErrorMode: Int{
    case pinOnly
    case userNamePassword
    case userNamePin
    case emailPassword
    case emailPin
    case ad
    case guestPin
}

struct EmailValidateResponse: Codable{
    
    public let success: Bool?
    public let message: String?
    public let abacusToken: String?
    public let clientToken: String?
    public let abacusUserName: String?
    public let abacusUserId: String?
    public let authErrorMode: Int?
    
    private enum CodingKeys: String, CodingKey {
       case success = "Success"
       case message = "Message"
       case abacusToken = "AbacusToken"
       case clientToken = "ClientToken"
       case abacusUserName = "AbacusUserName"
       case abacusUserId = "AbacusUserID"
       case authErrorMode = "RequiredAuthenticationMode"
   }
    
}

