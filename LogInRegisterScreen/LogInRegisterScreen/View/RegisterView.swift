//
//  RegisterView.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 24.07.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName=""
    @State private var email=""
    @State private var password=""
    @State private var password2=""
    
    @State private var wrongPassword2=0
    @State private var showingRegisterScreen=false
    @EnvironmentObject var viewModel :AuthViewModel
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.5),.blue]), startPoint: .bottomLeading, endPoint: .topLeading)
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 40)
                    .scale(0.4)
                    .foregroundColor(.blue.opacity(1.3))
                    .frame(width:900,height:950)
                
                RoundedRectangle(cornerRadius: 40)
                    .scale(0.37)
                    .foregroundColor(.white)
                    .frame(width:940,height:990)
                
                VStack(spacing: 6){
                    
                    Text("Register")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom,14)
                    TextField("Full Name",text:$fullName)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    TextField("Email",text:$email)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    SecureField("Re-Enter Password",text:$password2)
                        .padding()
                        .frame(width: 240,height:40)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongPassword2))
                    
                    Button{
//                        authetificatePassword(password2, password)
                        Task{
                            try await viewModel.createUser(withEmail:email, password:password,fullname: fullName)
                        }
                        
                    }label: {
                        HStack{
                            Text("Sign up")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 240,height:40)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top,8)
                    
                    NavigationLink(destination: Text("You have created an account \(email)"), isActive:$showingRegisterScreen){
                        EmptyView()
                    }

                    
                }
                .navigationBarHidden(true)
//                .foregroundColor(.white)
 
            }
        }
    }
    func authetificatePassword(_ password:String,_ password2:String){
        if(password == password2){
            wrongPassword2=0
            showingRegisterScreen = true
           

           
        }
        else {wrongPassword2=2}
        
    }}
struct RegisterView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RegisterView().environmentObject(AuthViewModel())
    }
}
