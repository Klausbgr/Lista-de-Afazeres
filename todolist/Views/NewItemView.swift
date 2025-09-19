//
//  NewItemView.swift
//  todolist
//
//  Created by  Klaus Boger on 08/04/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text ("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //Titulo
                TextField("O que pretende fazer?", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Data
                DatePicker("Due Data", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Botao
                TLButton(title: "Save",
                    background: .pink,) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Erro"),
                      message: Text("Por favor, preencha todos os campos e selecione uma data futura!"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: { _ in
        
    }))
}
