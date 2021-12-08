//
//  map.swift
//  HW4
//
//  Created by 吳承軒 on 2021/12/1.
//

import Foundation
import SwiftUI
import MapKit

//25.036067, 121.567972
struct map: View{
    let city = ["台北A13", "丹麥樂高樂園", "日本樂高樂園"]
    @State private var selectedCity = "丹麥樂高樂園"
    @State private var playTime = Date()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.036067, longitude: 121.567972), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    var body: some View {
        VStack{
            DatePicker("我要去那裡買樂高！", selection: $playTime, in: Date()..., displayedComponents: .date)
            NavigationView {
                Form {
                    Picker(selection: $selectedCity) {
                        ForEach(city, id: \.self) { city in
                            Text(city)
                        }
                    } label: {
                        Text("選擇樂高商店")
                    }
                }
                .navigationTitle("設定目的地")
            }
            Map(coordinateRegion: $region)
                .frame(width: 400, height: 300)
            Text(playTime.formatted(date: .long, time: .omitted))
        }
    }
}

struct map_Previews: PreviewProvider {
    static var previews: some View {
        map()
            .previewInterfaceOrientation(.portrait)
    }
}
