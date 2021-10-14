//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["slide2", "slide2_speech"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "slide2.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.imageVisible)
            Spacer()
            Text("“What if someone needs help but can’t talk?”, she asked herself. So she traced the location of the call. It didn’t seem suspicious. It was just a regular house in a residential area.")
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
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.playSound(resource: sounds[0], volume: 0.8)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                self.textVisible.toggle()
                self.playSound(resource: sounds[1], volume: 1.0)
            })
        })
    }
    
    func playSound(resource: String, volume: Float) {
        
        let url = Bundle.main.url(forResource: resource, withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.setVolume(volume, fadeDuration: 0)
            player.play()
        } catch {
            print("playback error")
        }
    }
}
    
    
PlaygroundPage.current.setLiveView(ContentView())
//: [Next Slide](@next)
