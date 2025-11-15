/*
 *  Lab 3
 *  Group 9
 *  Noa Tomas Mandorf
 *  Tyler Hager
 *  November 10, 2025
 */

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Match the flowers")
                    .font(.largeTitle)
                    .bold()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                            TileView(card: card).aspectRatio(1, contentMode: .fit)
                                .onTapGesture {
                                    withAnimation{
                                        viewModel.choose(card: card)
                                    }
                                }
                    }
                }
            }
        }
        .padding()
    }
}



struct TileView: View {
    var card: MemoryGameModel.Card
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 75, height: 75)
                .padding()
                .opacity(card.isFaceUp ? 0 : 1)
            Image(card.imageFile)
                .resizable()
                .padding()
                .opacity(card.isFaceUp ? 1 : 0)
        }
        .rotation3DEffect(
                    Angle.degrees(card.isFaceUp ? 0 : 180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 0.3), value: card.isFaceUp)
        
    }
}

#Preview {
    ContentView(viewModel: MemoryGameViewModel())
}
