//
//  SwiftUIView.swift
//  GithubUserApi
//
//  Created by Luis Eduardo Ramos on 27/03/2024.
// VISTA DE LA PANTALLA DE  DETALLE

import SwiftUI

struct DetailView: View {
    
    @State var user: Users
    var body: some View {
        VStack{
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack{
                Text("User: \(user.name ?? "")")
                Text("Email: \(user.email ?? "")")
                Text("Phone: \(user.phone ?? "")")
                Text("Compani: \(user.company?.name ?? "")")
            }
        }
    }
}
//PREVIEW DE LA VISTA
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: Users(id: 12, name: "marco", username: "el diablo", email: "chalala", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "12334", website: "", company: Company(name: "", catchPhrase:"", bs: "")) )
    }
}
