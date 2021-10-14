//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["sound1_slide4", "sound2_slide4", "slide4_speech"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "slide4.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.imageVisible)
            Spacer()
            Text("The detective heard dogs barking in the distance, but no other sounds. She decided to break in through the garage door. She cautiously entered the house, checking for anything suspicious. The dogs were still barking and Roberts followed the sound of their noises.")
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
            self.playSound(resource: sounds[0], volume: 0.4)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                self.playSound(resource: sounds[1], volume: 0.2)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
                self.textVisible.toggle()
                self.playSound(resource: sounds[2], volume: 1.00)
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
