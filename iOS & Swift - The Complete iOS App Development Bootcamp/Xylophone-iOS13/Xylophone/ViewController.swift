import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        
        
        var sound: String = sender.currentTitle!
        
        playSound(soundName: sound)
        UIView.animate(withDuration: 0.2, animations: {
                    sender.alpha = 0.5
                }) { _ in
                    // Completion block to reset the opacity to its original value
                    UIView.animate(withDuration: 0.2) {
                        sender.alpha = 1.0
                    }
                }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    
    
}
