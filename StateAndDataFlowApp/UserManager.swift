//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false {
        didSet {
            UserDefaults.standard.set(isRegistered, forKey: "isRegistered")
        }
    }
    var name = "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "username")
        }
    }
    
    init() {
        self.isRegistered = UserDefaults.standard.object(forKey: "isRegistered") as? Bool ?? false
        self.name = UserDefaults.standard.object(forKey: "username") as? String ?? ""
    }
}
