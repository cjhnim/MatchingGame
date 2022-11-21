//
//  ContentView.swift
//  MatchingGame
//
//  Created by 최정현 on 2022/11/07.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
        }
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if(card.isFaceUp) {
                RoundedRectangle(cornerRadius: conerRadious)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadious)
                    .stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: conerRadious)
                    .fill()
            }
        }
        .font(Font.system(size: fontSize(for: size) ))
    }
    
    
    // MARK: - Drawing Constants
    
    let conerRadious: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
