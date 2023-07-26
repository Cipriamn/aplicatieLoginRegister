//
//  ContentView.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 24.07.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email=""
    @State private var password=""
    @State private var wrongEmail=0
    @State private var wrongPassword=0
    @State private var showingLogInScreen=false
    @EnvironmentObject var viewModel :AuthViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.5),.blue]), startPoint: .bottomLeading, endPoint: .topLeading)
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 40)
                    .scale(0.4)
                    .foregroundColor(.blue.opacity(1.3))
                    .frame(width:900,height:700)
                
                RoundedRectangle(cornerRadius: 40)
                    .scale(0.37)
                    .foregroundColor(.white)
                    .frame(width:940,height:725)
                
                VStack{
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Email",text:$email)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongEmail))
                    
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongPassword))
                    
                    Button{
//                        authetificateUser(email, password)
                       Task{ try await viewModel.login(withEmail: email, password: password)}
                        
                    }label: {
                        HStack{
                            Text("Login")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 240,height:40)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in at \(email)"), isActive:$showingLogInScreen){
                        EmptyView()
                    }
                    
                    HStack(spacing:0){
                        Text("Don't have an account?")
                            .padding()
                        NavigationLink(destination:RegisterView()){
                            Text("Register Now")
                            .foregroundColor(.white)
                            .frame(width: 130,height:25)
                            .background(Color.blue)
                            .cornerRadius(10)}
                        
                        
                    }
                    
                    
                    
                    
                }
                .navigationBarHidden(true)
                
                
            }
        }}

    func authetificateUser(_ email:String,_ password:String){
        if(email.lowercased()=="ciprian"){
            wrongEmail=0
            if(password=="Ciprian"){
                wrongPassword=0
                showingLogInScreen=true
               
                
            }
            else{ wrongPassword=2
                
            }}
            else{ wrongEmail=2
                
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}
