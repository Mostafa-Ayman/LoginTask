//
//  SignUpPresenter.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import Foundation
class SignUpPresenter: BasePresenter {
    
    //MARK:  -PROPERTIES
    private var view : BaseViewProtocol?
    
    override func attachView(view : BaseViewProtocol) {
        self.view = view
        viewDidAttach()
    }
    
    override func viewDidAttach() {
        
    }
    

    
}
