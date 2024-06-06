//
//  NetWorking.swift
//  GithubUserApi
//
//  Created by Luis Eduardo Ramos on 14/03/2024.
//VIEWMODEL

import Foundation

class ViewModel: ObservableObject {
    // Propiedades publicadas para almacenar la lista de usuarios y la lista de usuarios filtrados
    @Published var users: listOfUsers = []
    @Published var filteredUSers: listOfUsers = []
    // Inicializador de la clase ViewModel
    init() {
        // Iniciar una tarea para obtener los usuarios cuando se crea una instancia de ViewModel
        Task {
            await getUsers()
        }
    }
    // Función asíncrona para obtener los usuarios de una URL remota
    func getUsers() async {
        // Definir la URL de la API de usuarios
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        // Realizar la solicitud HTTP para obtener los datos de la URL
        let (data, _) = try! await URLSession.shared.data(from: url)
        // Crear un decodificador JSON
        let decoder = JSONDecoder()
        // Configurar la estrategia de decodificación para convertir nombres de clave de snake_case a camelCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        // Actualizar las propiedades de usuarios y usuarios filtrados en el hilo principal
        DispatchQueue.main.async {
            // Decodificar los datos JSON en una lista de usuarios y asignarla a la propiedad users
            self.users =  try! decoder.decode(listOfUsers.self, from: data)
            // Inicializar filteredUSers con la lista completa de usuarios
            self.filteredUSers = self.users
        }
    }
    // Función para filtrar los usuarios basados en una consulta de búsqueda
    func filterUsers(query: String) {
        // Verificar si la consulta está vacía
        if query.isEmpty {
            // Si la consulta está vacía, establecer la lista de usuarios filtrados en la lista completa de usuarios
            filteredUSers = users
        } else {
            // Si la consulta no está vacía, filtrar los usuarios cuyos nombres contienen la consulta (ignorando mayúsculas y minúsculas)
            filteredUSers = users.filter { user in
                user.name!.lowercased().contains(query.lowercased())
            }
        }
    }
}
