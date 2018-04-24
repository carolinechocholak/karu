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
    var name: String
    var time: String
    var announcements: String
    var date: String
    var location: String
    var dictionary: [String : Any] {
        return [
            "name" : name,
            "time" : time,
            "announcements": announcements,
            "date" : date,
            "location" : location
        ]
    }
}
extension Event : DocumentSerializable {
    init?(dictionary : [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let time = dictionary["time"] as? String,
            let announcements = dictionary["announcements"] as? String,
            let date = dictionary["date"] as? String,
            let location = dictionary["location"] as? String
            else {return nil}
        self.init(
            name: name,
            time: time,
            announcements: announcements,
            date: date,
            location: location
        )
    }
}

struct Team {
    var name: String
    var city: String
    var code: String
    var mission: String
    var school: String
    var website: String
    var email: String
    var dictionary: [String : Any] {
        return [
            "name" : name,
            "city" : city,
            "code" : code,
            "mission" : mission,
            "school" : school,
            "website" : website,
            "email" : email
        ]
    }
}

extension Team : DocumentSerializable {
    init?(dictionary : [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let city = dictionary["city"] as? String,
            let code = dictionary["code"] as? String,
            let mission = dictionary["mission"] as? String,
            let school = dictionary["school"] as? String,
            let website = dictionary["website"] as? String,
            let email = dictionary["email"] as? String
            else {return nil}

        self.init(
            name: name,
            city: city,
            code: code,
            mission: mission,
            school: school,
            website: website,
            email: email
        ) 
    }
}
