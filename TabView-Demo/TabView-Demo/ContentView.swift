//
//  ContentView.swift
//  TabView-Demo
//
//  Created by Soumyadeep Chatterjee on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.lightGray
        UITabBar.appearance().layer.borderColor = UIColor.black.cgColor
        UITabBar.appearance().layer.borderWidth = 2
        UITabBar.appearance().layer.cornerRadius = 10
    }
    
    var body: some View {
            TabView(selection: $selectedTab){
                //This is one tab
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tabItem{
                        Image(systemName: "square.and.arrow.up.fill")
                        Text("Tab 1")
                    }
                    .tag(0)
                //This is 2nd tab
                Text("Hello world")
                    .tabItem{
                        Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                        Text("Tab 2")
                    }
                    .tag(1)
            }
            .padding()
        }
        
}

#Preview {
    ContentView()
}
