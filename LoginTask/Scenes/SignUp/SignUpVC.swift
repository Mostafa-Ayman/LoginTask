//
//  SignUpVC.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import UIKit
class SignUpVC: UIViewController , showOrHidePasswordTextFieldProtocol {
    
    //MARK:- OUTLET
    
    @IBOutlet weak var userNameTextField: AppTextfield!
    @IBOutlet weak var userEmailTextField: AppTextfield!
    @IBOutlet weak var userPhoneTextField: AppTextfield!
    @IBOutlet weak var userPasswordTextField: AppTextfield!
    @IBOutlet weak var confirmPasswordTextField: AppTextfield!
    @IBOutlet weak var signUpBtn: AppButton!
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    //MARK:- PROPERTIES
    private var presenter:SignUpPresenter?
    convenience init(presenter: SignUpPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        presenter?.attachView(view: self)
        title = "SignUp"
        userEmailTextField.placeholder = "Email"
        userPhoneTextField.placeholder = "Phone"
        userPasswordTextField.placeholder = "Password"
        confirmPasswordTextField.placeholder = "Confirm password"
        userNameTextField.placeholder = "Name"
    }
    
    //MARK:- Btn Actions
    @IBAction func signUpBtnAction(_ sender: Any) {
        switch isValidInputTextFieldData(){
        case .success:
            let name = userNameTextField.text!
            let phone = userPhoneTextField.text!
            let password = userPasswordTextField.text!
            let email = userEmailTextField.text!
            presenter?.saveUserData(name: name, phone: phone, email: email, password: password)
        case .failure(_, let message):
            presentAlert(title: nil, message: message.rawValue)
        }
    }
    
    @IBAction func showOrHidePasswordBtn(_ sender: Any) {
        showOrHidePassword(textField: userPasswordTextField, btn: showPasswordBtn)
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
        valid = presenter?.isEmailExist(email: userEmailTextField.text!)?.first?.email == nil ? .success : .failure(Alert.failure, AlertMessages.emailUsed)
        return valid
    }
    
    
}

//MARK: - BASE VIEW PROTOCOL
extension SignUpVC : BaseViewProtocol{
    
    func showAlertWith(title: String?, text: String) {
        presentAlert(title: title, message: text)
        
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
