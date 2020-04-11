//
//  UserTest.swift
//  Swift-UI
//
//  Created by Esteban Rodríguez Alonso on 10/04/20.
//  Copyright © 2020 Esteban Rodríguez Alonso. All rights reserved.
//

import Foundation

class User: ObservableObject {
    var url: String
    @Published var name: String
    @Published var birthDay: Date
    
    init() {
        name = ""
        birthDay = Date()
        url = "https://github.com/esteban-alo"
    }
    
    func getCurrentDate() -> Date {
        let currentDate = Date()
        return currentDate
    }
    
    func checkAge(birthDate: Date) ->  Bool {
        let today = Date()
        let components = Calendar.current.dateComponents(
            [.year, .month, .day],
            from: birthDate,
            to: today)
        return  components.year! >= 18 ? true : false
    }
}
