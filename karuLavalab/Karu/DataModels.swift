//
//  DataModels.swift
//  Karu
//
//  Created by John Zeiders on 4/10/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import Foundation

struct User {
    var email: String
    var name: String
    var photo: String
    
    var dictionary: [String : Any] {
        return [
            "email" : email,
            "name" : name,
            "photo" : photo
        ]
    }
    
}

extension User : DocumentSerializable {
    init?(dictionary : [String : Any]) {
        guard let email = dictionary["email"] as? String,
        let name = dictionary["name"] as? String,
        let photo = dictionary["photo"] as? String
            else {return nil}

        self.init(
            email: email,
            name: name,
            photo: photo
        )
    }
}

struct Event {
    var name: String;
    var dictionary: [String : Any] {
        return [
            "name" : name
        ]
    }
}
extension Event : DocumentSerializable {
    init?(dictionary : [String : Any]) {
        guard let name = dictionary["name"] as? String
            else {return nil}
        self.init(
            name: name
        )
    }
}

struct Team {
    var name: String;
    var dictionary: [String : Any] {
        return [
            "name" : name
        ]
    }
}

extension Team : DocumentSerializable {
    init?(dictionary : [String : Any]) {
        guard let name = dictionary["name"] as? String
            else {return nil}

        self.init(
            name: name
        )
    }
}
