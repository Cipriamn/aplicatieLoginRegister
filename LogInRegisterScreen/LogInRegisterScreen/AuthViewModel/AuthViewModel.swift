
import FirebaseAuth
import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    init(){
        Task{
            await fetchUser()
        }
        self.userSession = Auth.auth().currentUser
    }
    func login(withEmail email:String,password:String) async throws{
//        do{ try await Task.sleep( nanoseconds:1)}
       print("login")
    }
    func createUser(withEmail email:String,password:String,fullname:String) async throws{
        do{ let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession=result.user
            let user=User(id: result.user.uid, email: email, fullName: fullname)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()   
            
        }catch{
            print("failed to create user \(error.localizedDescription)")
            
        }
    }
    func signOut(){
        
    }
    func deleteAcc(){
        
    }
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else{return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
    
}
