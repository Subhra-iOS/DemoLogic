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


class JsonBodyController: UIViewController {

    func getEmailValidateRequestJSON(emailBody: EmailValidation) -> [String: Any]? {
        guard let data = getEmailValidateJSONData(emailBody: emailBody) else { return nil }
        return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

     private func getEmailValidateJSONData(emailBody: EmailValidation) -> Data? {
           return try? JSONEncoder().encode(emailBody)
     }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let emailDataModel: EmailValidationDataModel = EmailValidationDataModel(email: "subhra.roy@e-arc.com", serialNumber: "123456", ipAddress: "10.10.12.234", clientToken: "ABCNFJ1234AAddd")
        if let requestBody = EmailValidation.decode(emailDataModel){
            print("\(String(describing: self.getEmailValidateRequestJSON(emailBody: requestBody)))")
        }
    }
  
}

//************Email Validate API Body***********//

struct EmailValidation: Codable {
    private var requestBody: EmailValidationParam?
    
    private enum CodingKeys: String, CodingKey {
        case requestBody = "Request"
    }
    
    static func decode(_ model: EmailValidationDataModel) -> EmailValidation? {
        return EmailValidation(requestBody: EmailValidationParam.decode(model))
    }
}

struct EmailValidationParam: Codable{
    private var email: String?
    private var serialNumber: String?
    private var ipaddress: String?
    private var clientToken: String?
    
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

