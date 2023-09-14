//
//  FrontView.swift
//  Morpionnew
//
//  Created by goldorak on 13/09/2023.
//

import SwiftUI

struct FrontView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color.black // Couleur de fond
                    .edgesIgnoringSafeArea(.all)
            VStack {
                Image("morpillonpage")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Bienvenue dans la page d'acceuil")
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding(.top, 20)
                    .foregroundColor(.white)

        NavigationLink(destination:  ContentView()) {
            Text("Jouer au morpillon")
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
            } }
        }
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView()
    }
}
