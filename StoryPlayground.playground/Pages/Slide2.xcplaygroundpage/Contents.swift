//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["sound1_slide1", "sound2_slide1"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "slide1.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0).delay(0), value: self.imageVisible)
            Spacer()
            Text("On a cold stormy night in a small town in Minnesota, detective Roberts was sitting at her desk at the police station. Suddenly the phone rang. She picked it up, but there was silence on the other end. Thinking it was just a prank call, she hung up. Then the phone rang again.")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .lineSpacing(3)
                .opacity(textVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0).delay(13), value: self.textVisible)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 340, height: 550)
        .background(.black)
        .onAppear(perform: {
            self.imageVisible.toggle()
            self.textVisible.toggle()
            self.playSound(resource: sounds[0])
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(11), execute: {
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
