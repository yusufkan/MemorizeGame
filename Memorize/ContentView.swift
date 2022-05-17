//
//  ContentView.swift
//  Memorize
//
//  Created by Yusufkan Sürmelioğlu on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount = 4;
    let emojiArr: [String] = ["🛳","🚃","🚲","🚗","⛵️","🚤","🚀","🛸","🚁","🛶","🛻","🏎","🚜","🚒","🚠","🚉","🚂","🛵","🚌","🏍","🚓","🚛","🚅","🚑"]
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojiArr[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                Text("Shuffle")
                Spacer()
                add
            }
            .foregroundColor(.blue)
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        
    }
    
    var add: some View{
        Button{
            if(emojiCount<24){
                emojiCount += 1
            }
        }label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }
    
    var remove: some View{
        Button{
            if(emojiCount>1){
                emojiCount -= 1
            }
        }label: {
            VStack{
                Image(systemName: "minus.circle")
            }
        }
    }

struct CardView: View {
    var content: String
    @State var isFaceUp:Bool = false
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius:25)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
                            
        }.onTapGesture{
            isFaceUp = !isFaceUp
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 mini")
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
