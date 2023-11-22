//
//  ContentView.swift
//  Aula2
//
//  Created by Student14_02 on 21/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20){
            List(0..<16){
                Text("Item \($0)")
            }
        }
    }
}

struct PhotosView: View {
    var body: some View {
        VStack(spacing: 20){
            ForEach(0..<5){_ in
                Image("truck")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Hello, Hackatruck!")
                .padding(100)
                .background(.blue)
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PhotosView()
                .tabItem {
                    Label("Photos", systemImage: "photo")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
