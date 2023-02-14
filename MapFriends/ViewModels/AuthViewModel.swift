import FirebaseAuth
import FirebaseFirestore
import Foundation

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    private let db = Firestore.firestore()
    @Published var signedIn = false
    @Published var user = User(data:[:])
    var isSignedIn: Bool { return auth.currentUser != nil }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil, error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
                self?.db.collection("Users").whereField("userID", isEqualTo: self?.auth.currentUser?.uid as? String ?? "ERR").getDocuments{ doc, error in
                    if error == nil {
                        if let doc = doc {
                            
                            if let user = User(data: doc.documents.first?.data() ?? [:]){
                                self?.user = user
                               
                                //userInfo.set(user["firstName"], forKey: "firstName")
                                //userInfo.set(user["lastName"], forKey: "lastName")
                            }
                            
                        }
                        else {
                            print("Document doesn't exist.")
                        }
                        
                    } else {
                        print("Error getting documents.")
                    }
                    
                }
                if let user1 = self?.user {
                    UserDefaults.standard.set(user1.firstName, forKey: "firstName")
                    UserDefaults.standard.set(user1.lastName, forKey: "lastName")
                }
                else { print("Error getting user")}

            }
        }
    }
    
    func createUser(email: String, password: String, firstName: String, lastName:String, userName:String) {
        let docRef = db.collection("Users").document(userName)
        
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            // Email or Password Incorrect
            guard result != nil, error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
            // Adding document to User collection with the specified username as ID
            docRef.setData(["firstName":firstName, "lastName":lastName, "userID": self?.auth.currentUser?.uid as? String ?? ""]) { error in
                if error == nil {
                    print("Data successfully saved.")
                }
                else { print("Error saving data: \(error?.localizedDescription as Any)") }
            }
            self?.db.collection("Users").whereField("userID", isEqualTo: self?.auth.currentUser?.uid as? String ?? "ERR").getDocuments{ doc, error in
                if error == nil {
                    if let doc = doc {
                        
                        if let user = User(data: doc.documents.first?.data() ?? [:]){
                            self?.user = user
                        }
                    }
                    else {
                        print("Document doesn't exist.")
                    }
                    
                } else {
                    print("Error getting documents.")
                }
                
            }
                        
        }
    }
    
    func signUp(email: String, password: String, firstName: String, lastName: String, userName: String) {
        
        let docRef = db.collection("Users").document(userName)
        
        docRef.getDocument { document, error in
            
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            if let document = document, document.exists {
                print("Username already exists")
            }
            
            else {
                self.createUser(email: email, password: password, firstName: firstName, lastName: lastName, userName: userName)
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        signedIn = false
    }
}
