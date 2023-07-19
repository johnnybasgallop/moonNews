//
//  ContentView.swift
//  Moon News
//
//  Created by johnny basgallop on 17/07/2023.
//

import SwiftUI

var deviceWidth: CGFloat = UIScreen.main.bounds.size.width

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    
    var body: some View {
        
            VStack {
                TitleBar()
                NewsView()
        }
        .environmentObject(data)
        .onAppear {
            data.getData()
        }
    }
}


struct TitleBar : View {
    var body: some View {
        
        HStack{
            Text("Moon News").font(.custom("NicoMoji-Regular", size: 40))
            VStack{
                Image("AppIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
            }.offset(x: 12, y: 0)
        }.frame(width: deviceWidth, height: 100)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

