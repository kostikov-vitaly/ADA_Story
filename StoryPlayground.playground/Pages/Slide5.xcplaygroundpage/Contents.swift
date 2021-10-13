//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["slide5", "slide5_speech"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "slide5.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.imageVisible)
            Spacer()
            Text("Moving through the living room, she glanced at the table and saw a cellphone. It was in emergency only mode. The dogs were just pressing buttons and making it call 911 non-stop. The house owner came in just a few minutes later worried about his dogs. When the detective explained the situation, he refused to believe it: 'No, that couldn’t be them. They are very good boys!'")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .lineSpacing(3)
                .opacity(textVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.textVisible)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 350, height: 550)
        .background(.black)
        .onAppear(perform: {
            self.imageVisible.toggle()
            self.playSound(resource: sounds[0])
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.textVisible.toggle()
                self.playSound(resource: sounds[1])
            })
        })
    }
    
    func playSound(resource: String) {
        
        let url = Bundle.main.url(forResource: resource, withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch {
            print("playback error")
        }
    }
}
    
    
PlaygroundPage.current.setLiveView(ContentView())
//: [Next Slide](@next)
