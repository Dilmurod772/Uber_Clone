
import Foundation
import SwiftUI

struct User {
    var uid: String?
    var email: String?
    var displayName: String?
    var password: String?
    var imgUser: String?
    
    
    init(uid: String,displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
    
    init(email: String, displayName: String?, password: String?, imgUser: String?) {
        self.email = email
        self.displayName = displayName
        self.password = password
        self.imgUser = imgUser
    }
    
}
