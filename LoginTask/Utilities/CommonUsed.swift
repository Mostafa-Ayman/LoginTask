//
//  CommonUsed.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import Foundation
import RealmSwift

protocol EmailExistProtocol {}
protocol showOrHidePasswordTextFieldProtocol {}

extension showOrHidePasswordTextFieldProtocol{
    func showOrHidePassword(textField:UITextField , btn:UIButton){
        let isDots = textField.isSecureTextEntry
        textField.isSecureTextEntry = !isDots
        let img = !isDots ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        btn.setImage(img, for: .normal)
    }
}

extension EmailExistProtocol{
    func isEmailExist(email :String) -> Results<UserDataModel>? {
        var result:Results<UserDataModel>?
        let realm: Realm = try! Realm()
        do {
            try realm.write {
                result =   realm.objects(UserDataModel.self).filter("email=='\(email)'")
            }
        } catch  {
            result = nil
        }
        return result
    }
    
}
