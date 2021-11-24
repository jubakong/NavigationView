//
//  ContentView.swift
//  NavigationView
//
//  Created by Jeongbae Kong on 2021/11/23.
//

import SwiftUI

class User: ObservableObject {
  @Published var score = 0
}

struct ChangeView: View {
  @EnvironmentObject var user: User
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Score: \(user.score)")
      Button("Increase") {
        self.user.score += 1
      }
    }
  }
}

struct ResultView: View {
  let choice: String
  
  var body: some View {
    Text("You chose \(choice)")
  }
}

struct ContentView: View {
  @ObservedObject var user = User()
  
  var body: some View {
    
    NavigationView {
      VStack(spacing: 30) {
        Text("Score: \(user.score)")
        
        NavigationLink(destination: ChangeView()) {
          Text("Show Detail View")
        }
      }
      .navigationTitle("Navigation")
    }
    .environmentObject(user)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
