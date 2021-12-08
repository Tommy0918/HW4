//
//  page1.swift
//  HW4
//
//  Created by 吳承軒 on 2021/12/1.
//

import Foundation
import SwiftUI

struct page1: View{
    @State private var guessNumber: Int?
    @State private var result = ""
    @State private var scale: Double = 1
    @State private var showResult = false
    @State private var name = ""
    var answer = Int.random(in: 0...100)
    @FocusState private var isFocused: Bool
    @State private var brightnessAmount: Double = 0
    
    var body: some View{
        VStack {
            Text("Lego 76240")
            Image("ship")
                .scaleEffect(scale)
                .brightness(brightnessAmount)
            TextField("猜一下這艘船有幾片樂高", value: $guessNumber, format: .number, prompt: Text("猜一下這艘船有幾片樂高"))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .focused($isFocused)
                .padding()
            Button("Guess") {
                isFocused = false
                if let guessNumber = guessNumber {
                    if guessNumber == answer {
                        result = "答對了"
                    } else if answer > guessNumber {
                        result = "錯了！請猜多一點"
                    } else {
                        result = "錯了！請猜少一點"
                    }
                }
                showResult = true
            }
            Slider(value: $scale, in: 0...1)
            HStack{
                Text("現在倍率：")
                Text("\(scale, specifier: "%.2f")")
            }
            HStack {
                Text("亮度")
                Slider(value: $brightnessAmount, in: 0...1) {
                    Text("亮度")
                } minimumValueLabel: {
                    Image(systemName: "sun.max.fill").imageScale(.small)
                } maximumValueLabel: {
                    Image(systemName: "sun.max.fill").imageScale(.large)
                }
            }
        }
        .alert(result, isPresented: $showResult, actions: {
            Button("OK") {}
        })
    }
}

struct page1_Previews: PreviewProvider {
    static var previews: some View {
        page1()
            .previewInterfaceOrientation(.portrait)
    }
}
