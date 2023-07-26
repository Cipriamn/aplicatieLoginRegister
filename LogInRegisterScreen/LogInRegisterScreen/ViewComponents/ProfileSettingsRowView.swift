//
//  ProfileSettingsRowView.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 26.07.2023.
//

import SwiftUI

struct ProfileSettingsRowView: View {
    let imageName:String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct ProfileSettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsRowView(imageName:"gear" ,title:"Version" ,tintColor:.blue)
    }
}
