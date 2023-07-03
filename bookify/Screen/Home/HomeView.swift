//
//  HomeView.swift
//  bookify
//
//  Created by Gabriel on 30/06/23.
//

import SwiftUI
import SwiftUICharts
import TabBar

struct HomeView: View {
    @State private var selection: TabBarItem = .first
    @State private var visibility: TabBarVisibility = .visible
    var body: some View {
        GeometryReader { geometry in
            // Menu na parte inferior da tela
            VStack {
                Spacer()
                TabBar(selection: $selection, visibility: $visibility) {
                        MetricasView()
                            .tabItem(for: TabBarItem.first)
                        
                        Text("Second")
                            .tabItem(for: TabBarItem.second)
                        
                        Text("Third")
                            .tabItem(for: TabBarItem.third)
                    }
                .tabBar(style: CustomTabBarStyle())
                .tabItem(style: CustomTabItemStyle())
            }
        }
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}
