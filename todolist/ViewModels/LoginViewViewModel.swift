//
//  LoginViewViewModel.swift
//  todolist
//
//  Created by  Klaus Boger on 08/04/25.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Preencha todos os campos!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Informe um email válido!"
            return false
        }
        return true
    }
}
