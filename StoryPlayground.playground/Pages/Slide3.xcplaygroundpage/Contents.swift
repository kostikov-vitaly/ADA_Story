//: [Prev Slide](@previous)
import SwiftUI
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer!
let sounds = ["sound1_slide3", "sound2_slide3", "slide3_speech"]

struct ContentView: View {
    
    @State private var imageVisible = false
    @State private var textVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "slide3.png") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(imageVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 2.0), value: self.imageVisible)
            Spacer()
            Text("Detective Roberts came to the alleged location. She started checking the house with a flashlight to make sure she didn’t miss anything or anyone. It was locked and empty. “I guess it’s a false alarm” - she reported on the radio. But her colleague responded: “The calls keep coming from the same location”")
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
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                self.playSound(resource: sounds[1])
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
                self.textVisible.toggle()
                self.playSound(resource: sounds[2])
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
