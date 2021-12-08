//
//  baseball.swift
//  HW4
//
//  Created by 吳承軒 on 2021/12/1.
//

import Foundation
import SwiftUI

struct baseball: View{
    @State private var strike = true
        
        var body: some View {
            VStack {
                Image(systemName: strike ? "cloud.rain.fill" : "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(strike ? "strike out！...走回休息室" : "四壞球保送! 上到一壘！！")
                Toggle(isOn: $strike) {
                    Text("下個打席上壘嗎?")
                }
            }
        }
}

struct baseball_Previews: PreviewProvider {
    static var previews: some View {
        baseball()
            .previewInterfaceOrientation(.portrait)
    }
}
