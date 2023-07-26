//
//  ProfileView.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 26.07.2023.
//

import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var viewModel :AuthViewModel
    var body:some View {
        if let user = viewModel.currentUser{
            List{
                
                
                Section{
                    HStack{
                        
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width:72,height: 72)
                            .background(Gradient(colors: [.blue.opacity(0.5),.blue]))
                            .clipShape(Circle())
                        VStack(alignment:.leading, spacing: 4){
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                    
                }
                
                Section("General"){
                    HStack{
                        ProfileSettingsRowView(imageName: "gear", title: "Version", tintColor: .blue.opacity(0.7))
                        Spacer()
                        Text("1.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        
                    }}
                .foregroundColor(.white)
                    Section("Account"){
                        Button{
                            print("Sign out...")
                            
                        }label: {  ProfileSettingsRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: .blue.opacity(0.7))
                            
                        }
                        Button{
                            print("Deleting Account...")
                            
                        }label: {  ProfileSettingsRowView(imageName: "xmark.circle", title: "Delete Account", tintColor: .blue.opacity(0.7))
                            
                        }
                        
                    }
                    .foregroundColor(.white)
                    
                }
                .background(Gradient(colors: [.blue.opacity(0.5),.blue]))
                .scrollContentBackground(.hidden)
                
        }
        
      
        }
    }
struct ProfileViews_Previews:PreviewProvider{
    static var previews: some View{
        ProfileView().environmentObject(AuthViewModel())
    }
}
