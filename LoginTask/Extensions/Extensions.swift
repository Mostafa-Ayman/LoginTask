//
//  Extensions.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import UIKit

extension UIColor {
    static let appYellowColor = UIColor(red: 251 / 255, green: 221 / 255, blue: 26 / 255, alpha: 1.0)
    static let appIndigoColor = UIColor(red: 151 / 255, green: 87 / 255, blue: 166 / 255, alpha: 1.0)
    static let appLightGrayColor = UIColor(hex: "#C4C4C4").withAlphaComponent(0.5)
}

extension UIFont {
    static let avenir16Reg = UIFont(name: "Almarai-Regular", size: 16.0)
    static let avenir11Reg = UIFont(name: "Almarai-Regular", size: 11.0)
    static let avenir12Reg = UIFont(name: "Almarai-Regular", size: 12.0)
    static let avenir17Bol = UIFont(name: "Almarai-Bold", size: 17.0)
    static let avenir16Heavy = UIFont(name: "Almarai-Extrabold", size: 13.0)
    static let sfPro14SemiBold = UIFont(name: "SFProDisplay-Semibold", size: 15.0)
}

extension UIColor {
    static let appGreenColor = UIColor(hex: "#00928A")
    static let appDarkGreenColor = UIColor(hex: "#00473F")
    static let appDarkBlueColor = UIColor(hex: "#183562")
    static let lightGreenColor = UIColor(hex: "7BD1CB")
}

extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIViewController{
    
    // Alert with one dismiss action
    func presentAlert(title: String?,
                      message: String,
                      actionTitle: String = "Ok")
    {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: actionTitle,
                                     style: .default,
                                     handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }

    // Alert with one custom actions handler
    func presentAlert(message: String, title: String = "",
                      actionTitle: String = "Ok",
                      handler: ((UIAlertAction) -> Void)?)
    {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: actionTitle,
                                     style: .default,
                                     handler: handler)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }

    // Alert with two custom actions handler
    func presentAlert(title: String = "",
                      message: String,
                      actionTitle: String = "Ok",
                      cancelTitle: String = "Cancel",
                      actionHandler: ((UIAlertAction) -> Void)? = nil,
                      cancelHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: actionTitle,
                                     style: .default,
                                     handler: actionHandler)
        alertController.addAction(OKAction)
        let cancelAction = UIAlertAction(title: cancelTitle,
                                         style: .default,
                                         handler: cancelHandler)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

enum UserKeys {
        static let userName = "userName"
        static let userEmail = "userEmail"
        static let userPass = "userPass"
        static let userPhone = "userPhone"
}

extension UserDefaults {

    static func isExists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    

}



