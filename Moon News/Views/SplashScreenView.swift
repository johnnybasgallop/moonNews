//
//  SplashScreenView.swift
//  Moon News
//
//  Created by johnny basgallop on 19/07/2023.
//
var screenWidth = UIScreen.main.bounds.size.width
var screenHeight = UIScreen.main.bounds.size.height
var screenSize = UIScreen.main.bounds.size


import SwiftUI
import Lottie

struct SplashScreenView: View {
    @State private var isSplash : Bool = true
    var body: some View {
        if isSplash{
            VStack{
                Spacer()
                AnimatedView(isSplash: $isSplash).frame(width: 400, height: 400).offset(x: 0, y: -screenHeight/17)
                Spacer()
                Text("Moon News").font(.custom("NicoMoji-Regular", size: 40)).foregroundColor(Color("TitleColor")).offset(x: 0, y: -screenHeight / 8)
                
            }.frame( width: screenWidth, height: screenHeight)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.isSplash = false
                            }
                }
            
        }
        
        else {
            ContentView()
        }
    }
  
}

struct AnimatedView: UIViewRepresentable {
    @Binding var isSplash : Bool

    func makeUIView(context: Context) -> LottieAnimationView {
        
        let view = LottieAnimationView(name: "AstronaoutAnim", bundle: Bundle.main)
//        view.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        view.contentMode = .scaleAspectFit
        view.play()
        
        return view
        

    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
   
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
