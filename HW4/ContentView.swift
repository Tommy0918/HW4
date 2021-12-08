//
//  ContentView.swift
//  HW4
//
//  Created by 吳承軒 on 2021/12/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            page1()
                .tabItem {
                    Image(systemName: "books.vertical.circle.fill")
                    Text("樂高簡介")
                        .foregroundColor(Color.primary)
                }
            map()
                .tabItem{
                    Image(systemName: "car.circle")
                    Text("出遊行程")
                        .foregroundColor(Color.primary)
                }
            baseball()
                .tabItem{
                    Image(systemName: "gamecontroller.fill")
                    Text("小遊戲")
                        .foregroundColor(Color.primary)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

