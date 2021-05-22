//
//  LoginVC.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import UIKit

class LoginVC: UIViewController , showOrHidePasswordTextFieldProtocol{
    
    
    //MARK:- OUTLET
    @IBOutlet weak var emailTextField: AppTextfield!
    @IBOutlet weak var passwordTextField: AppTextfield!
    @IBOutlet weak var loginBtn: AppButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var showPasswordBtn: UIButton!

    //MARK:- PROPERTIES
    private var presenter:LoginPresenter!
    convenience init(presenter: LoginPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        presenter?.attachView(view: self)
        title = "Login"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        emailTextField.font = UIFont.avenir16Reg
        passwordTextField.font = UIFont.avenir16Reg
    }
    
    //MARK: - BTN ACTIONS
    @IBAction func loginBtnAction(_ sender: Any) {
        switch isValidInputTextFieldData(){
        
        case .success:
            checkexistData()
        case .failure( _, let message):
            showAlertWith(title: "Failed", text: message.rawValue)
        }
    }

    @IBAction func signUpBtnAction(_ sender: Any) {
        let viewController = SignUpVC(presenter: SignUpPresenter())
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func showOrHidePassword(_ sender: Any) {
        showOrHidePassword(textField: passwordTextField, btn: showPasswordBtn)
    }

    //MARK:- VALIDATION
    func isValidInputTextFieldData() -> Valid{
        let valid = Validation.shared.validate(values:
                                                    (ValidationType.email, inputValue: emailTextField.text!),
                                                  (ValidationType.password, inputValue: passwordTextField.text!))
        return valid
      
        }
    
    func checkexistData(){
        let data = presenter?.isEmailExist(email: emailTextField.text!)?.first
        guard data?.email == nil else {
            guard data?.password == passwordTextField.text else {
                showAlertWith(title: nil, text: "Check your password")
                return
            }
            showAlertWith(title: "Success", text: "Login successfuly")
            return
        }
        showAlertWith(title: nil, text: "Data not found")
    }
}


//MARK: - BASE VIEW PROTOCOL
extension LoginVC : BaseViewProtocol{
    
    func showAlertWith(title: String?, text: String) {
        self.presentAlert(title: title, message: text)

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
