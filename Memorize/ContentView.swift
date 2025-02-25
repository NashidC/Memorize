//
//  ContentView.swift
//  Memorize
//
//  Created by Nashid  on 1/26/25.
//

import SwiftUI

//ContentView structure defines the main view of the app
struct ContentView: View {
    
    let emojis = [ "👻", "🎃","🕷","😈", "🕸", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    //state var that controls initial number of cards displayed on screen
//    @State var cardCount: Int = 4
    
    var body: some View {
//        VStack { //arrangees views vertically
            ScrollView {
            cards
            }
//            Spacer()
//            HStack { //arranges buttons horizontally
//                Button(action: {
//                }, label: {
//                })
//                cardAdder
//                Spacer()
//                cardRemover
//            }
//        }
    
            .padding()
}
    
   
    
    var cards: some View {
        //gridview that adaps to screensize
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            //loops through numbers - count and creates cardView
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index]) //each card shows an emoji from the list
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
//    var cardRemover: some View {
//        Button("Remove Card") {
//            if cardCount > 1  {
//            cardCount -= 1
//            }
//        }
//    }
//
//    var cardAdder: some View {
//        Button("Add Card") {
//            if cardCount < emojis.count {
//            cardCount += 1
//            }
//
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    let content: String //emoji that will be displayed on card
    @State var isFaceUp: Bool = true //keeps track of face up/face down
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
                
            }
            .opacity(isFaceUp ? 1 : 0) //front side of card is visible if face up
            base.fill().opacity(isFaceUp ? 0 : 1)//back side is visible if face down
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
