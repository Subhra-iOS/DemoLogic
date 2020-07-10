//
//  JsonBodyController.swift
//  DemoLogic
//
//  Created by Subhra Roy on 10/07/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit


struct EmailValidationDataModel {
    public let email: String?
    public let serialNumber: String?
    public let ipAddress: String?
    public let clientToken: String?
}

struct EmailAuthenticationDataModel {
    public let email: String?
    public let serialNumber: String?
    public let ipAddress: String?
    public let clientToken: String?
    public let authMode: Int?
    public let userName: String?
    public let password: String?
    public let pin: String?
}


class JsonBodyController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Validate
        let emailDataModel: EmailValidationDataModel = EmailValidationDataModel(email: "alice@example.com", serialNumber: "MY57V4Q00G", ipAddress: "10.10.12.234", clientToken: "ABCNFJ1234AAddd")
        if let requestBody = EmailValidation.decode(emailDataModel){
            print("Email Validate : \(String(describing: EmailValidation.encode(body: requestBody)))")
        }
        //Authenticate
        let authDataModel : EmailAuthenticationDataModel = EmailAuthenticationDataModel(email: "alice@example.com", serialNumber: "MY57V4Q00G", ipAddress: "10.10.12.234", clientToken: "ABCNFJ1234AAddd", authMode: AuthErrorMode.emailPassword.rawValue, userName: "Alice", password: "123456", pin: "123")
        
        if let requestBody = NewEmailAuthetication.decode(authDataModel){
            print("New Email Authenticate : \(String(describing: NewEmailAuthetication.encode(body: requestBody)))")
        }
        
    }
  
}

//************Email Validate API Request Body***********//

struct EmailValidation: Codable {
    private var requestBody: EmailValidationParam?
    
    private enum CodingKeys: String, CodingKey {
        case requestBody = "Request"
    }
    
    static func decode(_ model: EmailValidationDataModel) -> EmailValidation? {
        return EmailValidation(requestBody: EmailValidationParam.decode(model))
    }
    
    static func encode(body: EmailValidation) -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(body) else { return nil }
        return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

}

struct EmailValidationParam: Codable{
    private let email: String?
    private let serialNumber: String?
    private let ipaddress: String?
    private let clientToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case email = "Email"
        case serialNumber = "SerialNumber"
        case ipaddress = "IPAddress"
        case clientToken = "ClientToken"
    }
    
    static func decode(_ model: EmailValidationDataModel) -> EmailValidationParam? {
        guard let serialNo = model.serialNumber, let ipAddress = model.ipAddress else { return nil }
        return  EmailValidationParam(email: model.email, serialNumber: serialNo, ipaddress: ipAddress, clientToken: model.clientToken)
    }
    
}
//*************************Email Authetication API Request for New Abacus User************//
struct NewEmailAuthetication: Codable {
    
    private let email: String?
    private let serialNumber: String?
    private let ipaddress: String?
    private let authenticationMode: Int?
    private let userKey : String?
    private let passkey: String?
    private let pin: String?
    
    private enum CodingKeys: String, CodingKey {
        case email = "Email"
        case serialNumber = "SerialNumber"
        case ipaddress = "IPAddress"
        case authenticationMode = "AuthenticationMode"
        case userKey  = "Userkey"
        case passkey = "Passkey"
        case pin  = "PIN"
    }
    
    static func decode(_ model: EmailAuthenticationDataModel) -> NewEmailAuthetication?{
        guard let email = model.email, let serialNo = model.serialNumber, let ipAddress = model.ipAddress else { return nil }
        return NewEmailAuthetication(email: email, serialNumber: serialNo, ipaddress: ipAddress, authenticationMode: model.authMode, userKey: model.userName, passkey: model.password, pin: model.pin)
    }
    
    static func encode(body: NewEmailAuthetication) -> [String: Any]? {
       guard let data = try? JSONEncoder().encode(body) else { return nil }
       return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
   }
    
}
