//
//  UserDataModel.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 22/05/2021.
//

import Foundation
import RealmSwift
class UserDataModel : Object {
    @objc dynamic var name:String!
    @objc dynamic var phone:String!
    @objc dynamic var email:String!
    @objc dynamic var password:String!
}
