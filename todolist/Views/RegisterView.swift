//
//  RegisterView.swift
//  todolist
//
//  Created by  Klaus Boger on 08/04/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // header
            HeaderView(title: "Registre-se",
                       subtittle: "Comece a se organizar",
                       angle: -15,
                       background: .orange)
            
            Form {
                TextField("Nome Completo", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("E-mail", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Crie uma senha", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Criar conta",
                    background: .green
                ) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
