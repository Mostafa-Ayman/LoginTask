//
//  SignUpPresenter.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import Foundation
import RealmSwift

class SignUpPresenter: BasePresenter  , EmailExistProtocol{
    
    
    //MARK:  -PROPERTIES
    private var view : BaseViewProtocol?
    let realm: Realm = try! Realm()
    
    override func attachView(view : BaseViewProtocol) {
        self.view = view
        viewDidAttach()
    }
    
    override func viewDidAttach() {
    }
    
    func saveUserData(name :String , phone:String , email: String , password:String ){
        let newUserData = UserDataModel()
        newUserData.email = email
        newUserData.name = name
        newUserData.password = password
        newUserData.phone = phone
        do {
            try realm.write{
                realm.add(newUserData)
                self.view?.showAlertWith(title: nil, text: "Saved succesfully" )
            }
        } catch {
            self.view?.showAlertWith(title: nil, text: "Failed to save data")
        }
    }
    
}
