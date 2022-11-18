//
//  ContentView.swift
//  MatchingGame
//
//  Created by 최정현 on 2022/11/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Spacer(minLength: 15)
            Text(viewModel.title).font(Font.largeTitle)
            
            GridView(cards: viewModel.cards, max_row: 4, max_col: 6)
            
            HStack {
                ForEach(viewModel.themes.indices, id: \.self) { index in
                    ThemeView(theme: viewModel.themes[index]).onTapGesture {
                        viewModel.selectTheme(index: index)
                    }
                }
            }
        }
    }
}
struct ThemeView: View {
    let theme: EmojiMemoryGame.Theme
    
    var body: some View {
        VStack {
            Text(theme.icon)
            Text(theme.text).font(Font.caption)
        }.padding([.leading, .trailing], 1)
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

struct GridView: View {
    
    var cards : Array<MemoryGame<String>.Card>
    let max_row: Int
    let max_col: Int
    
    var body: some View {
        VStack {
            ForEach(0..<max_col, id: \.self) { col in
                HStack {
                    let startIndex = col*max_row
                    let endIndex = startIndex + max_row
                    
                    ForEach(startIndex..<endIndex, id: \.self) { cardIndex in
                        if(cards.indices.contains(cardIndex)) {
                            CardView(card: cards[cardIndex])
                        } else {
                            NonCardView()
                        }
                    }
                }
            }
        }
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
    }
    
    struct NonCardView: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
