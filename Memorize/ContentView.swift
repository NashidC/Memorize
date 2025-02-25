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
            cards
            .foregroundColor(.orange)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    
                })
                cardAdder
                Spacer()
                cardRemover
            }
        }
           
            .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
    }
    
    var cardRemover: some View {
        Button("Remove Card") {
            if cardCount > 1  {
            cardCount -= 1
            }
        }
    }
    
    var cardAdder: some View {
        Button("Add Card") {
            if cardCount < emojis.count {
            cardCount += 1
            }
            
        }
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
