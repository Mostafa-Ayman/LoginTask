//
//  LoginPresenter.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//
import RealmSwift


class LoginPresenter: BasePresenter , EmailExistProtocol{
    
    //MARK: - PROPERTIES.
    private var view : BaseViewProtocol?
    
    override func attachView(view : BaseViewProtocol) {
        self.view = view
        viewDidAttach()
    }
    
    override func viewDidAttach() {
        
    }

}
