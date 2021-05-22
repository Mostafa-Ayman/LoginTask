//
//  LoginVC.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import UIKit
import RealmSwift

class LoginVC: UIViewController {
    
    
    //MARK:- OUTLET
    @IBOutlet weak var emailTextField: AppTextfield!
    @IBOutlet weak var passwordTextField: AppTextfield!
    @IBOutlet weak var loginBtn: AppButton!
    @IBOutlet weak var signUpBtn: UIButton!


    //MARK:- PROPERTIES

    let realm = try! Realm()

    var resarr : Results<UserDataModel>!
    private var presenter:LoginPresenter?
    
    convenience init(presenter: LoginPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(view: self)
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        emailTextField.font = UIFont.avenir16Reg
        passwordTextField.font = UIFont.avenir16Reg
        
getdat()

        // Do any additional setup after loading the view.
    }
    func getdat(){
        
        let newUserData = UserDataModel()
        let email = emailTextField.text!
        let password = passwordTextField.text!
        newUserData.email = email
        newUserData.password = password
        
        do {
            try realm.write {
                
                //realm.objects(newUserData.self).filter("title contains[c] %@", email)
            }
        } catch  {
            
        }
        
        
        
    }
    
    //MARK: - BTN ACTIONS
    
    @IBAction func loginBtnAction(_ sender: Any) {
        switch isValidInputTextFieldData(){
        
        case .success:
            //TODO:- check that if data saved or not .
        return
        case .failure( _, let message):
            showAlertWith(title: "Failed", text: message.rawValue)
        }
        
    }
    

    @IBAction func signUpBtnAction(_ sender: Any) {
    
        let viewController = SignUpVC(presenter: SignUpPresenter())
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    
    //MARK:- VALIDATION
    func isValidInputTextFieldData() -> Valid{
        let valid = Validation.shared.validate(values:
                                                    (ValidationType.email, inputValue: emailTextField.text!),
                                                  (ValidationType.password, inputValue: passwordTextField.text!))
        return valid
      
        }
    
    
    

}


//MARK: - BASE VIEW PROTOCOL
extension LoginVC : BaseViewProtocol{
    func showLoader() {
    }
    
    func hideLoader() {
    }
    
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
