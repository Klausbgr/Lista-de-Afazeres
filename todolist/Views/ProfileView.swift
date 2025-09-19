//
//  ProfileView.swift
//  todolist
//
//  Created by  Klaus Boger on 10/04/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Carregando Perfil...")
                }
            }
            .navigationTitle("Perfil")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //info: name, email, membro desde
        VStack(alignment: .leading) {
            HStack {
                Text("Nome: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Membro Desde: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970:user.joined).formatted(date: .abbreviated, time:.shortened))")
            }
            .padding()
        }
        .padding()
        
        //sair da conta
        Button("Sair da Conta") {
            viewModel.logOut()
        }
        .tint(Color.red)
        .padding()
        
        Spacer()
        }
    }

#Preview {
    ProfileView()
}
