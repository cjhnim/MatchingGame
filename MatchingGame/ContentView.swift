//
//  ContentView.swift
//  MatchingGame
//
//  Created by 최정현 on 2022/11/07.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
            .foregroundColor(Color.orange)
            .padding()
            .font(Font.largeTitle)
        }
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if(card.isFaceUp) {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
