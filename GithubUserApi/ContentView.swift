//
//  ContentView.swift
//  GithubUserApi
//
//  Created by Luis Eduardo Ramos on 13/03/2024.
// VISTA  PRINCIPAL 

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack{
            List(viewModel.filteredUSers, id: \.id) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black)
                            .clipShape(Circle())
                        VStack {
                            Text(user.name ?? "")
                            Text(user.email ?? "")
                        }.font(.title3)
                    }
                }
                
            }
            .searchable(text: $searchQuery, prompt: "search users")
            .onChange(of: searchQuery, perform: {
                query in
                viewModel.filterUsers(query: query)
            } )
            .navigationTitle("list of users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
