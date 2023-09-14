//
//  ContentView.swift
//  ProjetMorpion
//
//  Created by goldorak on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var plateau = Array(repeating:"", count:9)
    @State private var joueur = "X"
    @State private var isOver = false
    
    var body: some View {
        ZStack {
            Color.black // Couleur de fond
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Tour du joueur: \(joueur)")
                    .font(.title)
                    .foregroundColor(.white)
                //            HStack(spacing: 0){
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), alignment: .center, spacing: 0){
                    ForEach(0..<9, id:\.self){ index in
                        Button(action: {
                            if plateau[index] == "" && !isOver{
                                plateau[index] = joueur
                                if isWin() || isDraw() {
                                    isOver = true
                                }
                                else {
                                    joueur = (joueur == "X") ? "O" : "X"
                                }
                            }}) {
                                
                                Text(plateau[index])
                                    .font(.largeTitle)
                                    .frame(width:100, height: 100)
                                    .background(Color.black.opacity(1))
                                    .foregroundColor(.white)
                                    .border(.white)
                            }
                        
                    }
                }.padding(51)
                if isOver {
                    if isWin(){Text("Le joueur \(joueur) a gagné").foregroundColor(.white)}
                    else{
                        Text("Egalité")
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        isOver = false
                        plateau = Array(repeating:"", count:9)
                        
                        
                    }){
                        Text("Rejouer")}
                    .padding(10)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
                
                
            }}
    }
    func isWin() -> Bool{
        let winningCondition: [[Int]] = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        for combination in winningCondition {
            if plateau[combination[0]] != "" && plateau[combination[0]] == plateau[combination[1]] && plateau[combination[1]] == plateau[combination[2]]{
                return true
            }
        }
        return false
    }
    
    func isDraw() -> Bool{
        for i in plateau {
            if i == ""{
                return false
            }
        }
        return true
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
