//
//  ToDoListView.swift
//  todolist
//
//  Created by  Klaus Boger on 08/04/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery (
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel (userid: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List (items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Excluir") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "RyvyhjLNhpgJpRIiPi0U3TGH0Jw1")
}
