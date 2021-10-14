//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["slide6"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        Image(uiImage: UIImage(named: "slide6.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.imageVisible)
                .frame(width: 350, height: 550)
                .background(Color.init(red: 0.9, green: 0.90, blue: 0.9, opacity: 1.0))
                .onAppear(perform: {
                    self.imageVisible.toggle()
                    self.playSound(resource: sounds[0], volume: 0.3)
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
