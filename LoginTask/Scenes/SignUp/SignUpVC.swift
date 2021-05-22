//
//  SignUpVC.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import UIKit
import RealmSwift
class SignUpVC: UIViewController {

    //MARK:- OUTLET

    @IBOutlet weak var userNameTextField: AppTextfield!
    @IBOutlet weak var userEmailTextField: AppTextfield!
    @IBOutlet weak var userPhoneTextField: AppTextfield!
    @IBOutlet weak var userPasswordTextField: AppTextfield!
    @IBOutlet weak var confirmPasswordTextField: AppTextfield!
    @IBOutlet weak var signUpBtn: AppButton!
    
    //MARK:- PROPERTIES
    private var presenter:SignUpPresenter?
    let realm = try! Realm()

    
    convenience init(presenter: SignUpPresenter) {
        self.init()
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(view: self)
        userEmailTextField.placeholder = "Email"
        userPhoneTextField.placeholder = "Phone"
        userPasswordTextField.placeholder = "Password"
        confirmPasswordTextField.placeholder = "Confirm password"
        userNameTextField.placeholder = "Name"

    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        
        switch isValidInputTextFieldData(){
        
        case .success:
            saveUserData()
        case .failure(_, let message):
            presentAlert(title: nil, message: message.rawValue)
        }
        
    }
    
    func saveUserData(){
        let newUserData = UserDataModel()
        let name = userNameTextField.text!
        let password = userPasswordTextField.text!
        let email = userEmailTextField.text!
        let phone = userPhoneTextField.text!
        newUserData.email = email
        newUserData.name = name
        newUserData.password = password
        newUserData.phone = phone

        do {
            try realm.write{
                realm.add(newUserData)
                presentAlert(title: nil,message: "Saved succesfully")
            }
        } catch  {
            presentAlert(title: nil,message: "Failed to save data")
        }
    }
    
    //MARK:- VALIDATION
    func isValidInputTextFieldData() -> Valid{
        var valid = Validation.shared.validate(values:
                                                    (ValidationType.name, inputValue: userNameTextField.text!),
                                                  (ValidationType.email, inputValue: userEmailTextField.text!),
                                                  (ValidationType.phoneNo, inputValue: userPhoneTextField.text!),
                                                  (ValidationType.password, inputValue: userPasswordTextField.text!))
        guard valid == .success else {
            return valid
        }
        valid = (userPasswordTextField.text == confirmPasswordTextField.text) ? .success : .failure(Alert.failure, AlertMessages.notEqualConfirmPassword)
        
        guard  valid == .success  else {
            return valid
        }
        valid = isEmailExist() == nil ? .success : .failure(Alert.failure, AlertMessages.emailUsed)
        
        return valid
      
        }
    
    func isEmailExist() -> String? {
        var result:String?
        do {
            try realm.write {
                result =   realm.objects(UserDataModel.self).filter("email=='\(userEmailTextField.text!)'").first?.email
                print(result)
            }
        } catch  {
            result = nil
            
        }
        
        return result
    }
    

}

extension SignUpVC : BaseViewProtocol{
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
    func showAlertWith(title: String?, text: String) {
        
    }
    
    func displayConnectionError() {
        
    }
    
    func reloadView() {
        
    }
    
    func displayNoResultsView() {
        
    }
    
    func displaySuccessConnection() {
        
    }
    
    
}
