//
//  ContentView.swift
//  swiftuifirebasestudy
//
//  Created by kenan on 2.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          
            Text("Open terminal").onAppear{
                let udao = UserDAO()
                udao.saveUser(user_name: "Kenan", user_age: 24)
                udao.getAllUsers()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
