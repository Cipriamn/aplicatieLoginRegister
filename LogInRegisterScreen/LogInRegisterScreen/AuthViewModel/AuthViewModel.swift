

import Foundation
//import Firebase

class AuthViewModel: ObservableObject {
//    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser:User?
    init(){
        
    }
    func login(withEmail email:String,password:String) async throws{
//        do{ try await Task.sleep( nanoseconds:1)}
       print("login")
    }
    func createUser(withEmail email:String,password:String) async throws{
//        do{ try await Task.sleep(nanoseconds:1)}
        print("created user")
    }
    func fetchUser() async{
        
    }
    
}
