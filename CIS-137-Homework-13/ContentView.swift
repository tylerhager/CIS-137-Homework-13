/*
 *  CIS-137
 *  Homework 13
 *  Tyler Hager
 *  November 15, 2025
 */

import SwiftUI

struct GameProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        let lineColor: Color
        if fractionCompleted < 0.5 {
            lineColor = .red
        }
        else if fractionCompleted < 0.8 {
            lineColor = .yellow
        }
        else {
            lineColor = .green
        }
        return ProgressView(configuration).tint(lineColor)
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Match the flowers")
                    .font(.largeTitle)
                    .bold()
                ProgressView("Matches found", value: Double(viewModel.pairsFound), total: Double(viewModel.pairs))
                    .progressViewStyle(GameProgressStyle())
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
