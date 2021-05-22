//
//  ValidationTextField.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import Foundation

enum Valid:Equatable {
    case success
    case failure(Alert, AlertMessages)
}

enum Alert {        //for failure and success results
    case success
    case failure
    case error
}

enum ValidationType {
    case phoneNo
    case password
    case CRN
    case address
    case nationalID
    case VATNumber
    case name
    case stock
    case productCategory
    case barCode
    case InvoiceNum
    case checkNumber
    case transactionNum
    case transferNum
    case email
 }


enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{6,20}$" // Password length 6-20
    case phoneNo = "[0-9]{11}" // PhoneNo 11 Digits
    case CRN = "[0-9]{10}"
    case VATNumber = "[0-9]{15}"
    case address = "^.{10,}$"  //20 is the minimum and any char or num
    case nationalID = "([0-9]{14}|[0-9]{10})"  //national id 10 or 14 numbers only for egypt and saudi num.
    case name = "^.{5,}$"      //5 is the minimum and any char or num
    case stock = "[0-9]{1,}"
    case productCategory = "^.{2,}$"
    case barCode = "[0-9]{3,}"
    case invoiceNum = "[0-9]{2,}"
 }

enum AlertMessages: String {
    case inValidPhone = "Invalid Phone"
    case emptyPhone = "Enter phone number"
    case inValidPSW = "Password Length must be 6-20"
    case emptyPSW = "Enter Password"
    case inValidNationalID = "Enter valid national ID"
    case emptyNatonalID = "Enter national ID"
    case emptyAddress = "Enter address"
    case invalidAddress = "Enter valid Address"
    case emptyVATNumber = "Enter VAT number"
    case invalidVATNumber = "Enter valid VAT number"
    case emptyCRN = "Enter CRN"
    case invalidCRN = "Invalid CRN"
    case invalidName = "Enter valid name"
    case emptyName = "Enter name"
    case emptyStock = "Enter stock value"
    case emptyCategory = "Enter category"
    case invalidCategory = "Enter valid category"
    case invalidStock = "Enter valid stock value"
    case invalidBarCode = "Enter Valid Barcode"
    case EmptyBarCode = "Enter barcode value or scan it"
    case emptyInvoiceNum = "Enter invoice number"
    case invalidInvoiceNum = "Enter valid invoice number"
    case emptyCheckNum = "Enter check number"
    case invalidCheckNum = "Enter valid check number"
    case emptyTransactionNum = "Enter transaction number"
    case invalidTransactionNum = "Enter valid transaction number"
    case emptytTransferNum = "Enter transfer number"
    case invalidTransferNum = "Enter valid transfer number"
    case emptyEmail = "Enter email"
    case invalidEmail = "Enter valid email"
    case notEqualConfirmPassword = "Confirm password does not match password"
    case emailUsed = "Email used before.. enter another one"
    
    

    
}



class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            
            case .CRN:
            if let tempValue = isValidString((valueToBeChecked.inputValue, .CRN, .emptyCRN, .invalidCRN)) {
                return tempValue
            }
                
            case .VATNumber:
            if let tempValue = isValidString((valueToBeChecked.inputValue, .VATNumber, .emptyVATNumber, .invalidVATNumber)) {
                return tempValue
            }
            case .address:
            if let tempValue = isValidString((valueToBeChecked.inputValue , .address , .emptyAddress , .invalidAddress)){
                return tempValue
                
            }
            case .nationalID:
                if let tempValue = isValidString((valueToBeChecked.inputValue , .nationalID , .emptyNatonalID , .inValidNationalID)){
                    return tempValue
                    
                }
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo, .emptyPhone, .inValidPhone)) {
                    return tempValue
                }
           
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .inValidPSW)) {
                    return tempValue
                }
            case .name:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .name, .emptyName, .invalidName)) {
                    return tempValue
                }
            case .stock:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .stock, .emptyStock, .invalidStock)) {
                    return tempValue
                }
            case .productCategory:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .productCategory, .emptyCategory, .invalidCategory)) {
                    return tempValue
                }
            case .barCode:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .barCode, .EmptyBarCode, .invalidBarCode)) {
                    return tempValue
                }
            case .InvoiceNum:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .invoiceNum, .emptyInvoiceNum, .invalidInvoiceNum)) {
                    return tempValue
                }
            case .checkNumber:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .invoiceNum, .emptyCheckNum, .invalidCheckNum)) {
                    return tempValue
                }
            case .transactionNum:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .invoiceNum, .emptyTransactionNum, .invalidTransactionNum)) {
                    return tempValue
                }
            case .transferNum:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .invoiceNum, .emptytTransferNum, .invalidTransferNum)) {
                    return tempValue
                }
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .invalidEmail)) {
                    return tempValue
                }
                
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

