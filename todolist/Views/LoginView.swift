//
//  LoginView.swift
//  todolist
//
//  Created by  Klaus Boger on 10/04/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(title: "Gerencie",
                           subtittle: "Suas Tarefas Aqui",
                           angle: 15,
                           background: .pink)
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("E-mail", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Entrar",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
                // create account
                
                VStack {
                    Text("Novo Aqui?")
                    NavigationLink("Crie sua conta", destination: RegisterView())
                    }
                .padding(.bottom, 50)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
