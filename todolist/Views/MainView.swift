//
//  MainView.swift
//  todolist
//
//  Created by  Klaus Boger on 10/04/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.circle")
                }
        }
    }
}
#Preview {
    MainView()
}
