//
//  ContentView.swift
//  Memorize
//
//  Created by Nashid  on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [ "👻", "🎃","🕷","😈", "🕸", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                Button("Add Card") {
                    cardCount += 1
                }
                Spacer()
                Button("Remove Card") {
                    cardCount -= 1
                }
            }
        }
           
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
                
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
