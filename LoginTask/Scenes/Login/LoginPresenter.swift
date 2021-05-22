//
//  LoginPresenter.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//


class LoginPresenter: BasePresenter {
    private var view : BaseViewProtocol?
    
    override func attachView(view : BaseViewProtocol) {
        self.view = view
        viewDidAttach()
    }
    
    override func viewDidAttach() {
        
    }
    

  
}
