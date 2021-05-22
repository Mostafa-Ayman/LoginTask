//
//  BaseViewController.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//


protocol BaseViewProtocol: class {
    func showAlertWith(title: String?, text: String)
    func displayConnectionError()
    func reloadView()
    func displayNoResultsView()
    func displaySuccessConnection()
}
