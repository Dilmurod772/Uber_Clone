
import Foundation
import Foundation
import FirebaseFirestore

class DatabaseStore: ObservableObject{
    
    var USER_PATH = "users"
    let store = Firestore.firestore()
    
    func storeUser(user: User){
        let params = ["uid": user.uid, "email": user.email, "displayName": user.displayName, "password": user.password]
        store.collection(USER_PATH).document(user.uid!).setData(params)
    }
    
    
}
