//
//  SecondViewController.swift
//  MusicPlayerApp
//
//  Created by Gulnaz on 04.11.2022.
//

import UIKit
import AVFAudio

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var sliderVolum: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = songs[thisSong]
    }


    @IBAction func sliderVolum(_ sender: Any) {
        
        audioPlayer.volume = sliderVolum.value
    }
    
    
    @IBAction func buttomPlayPause(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
            sender.tintColor = .black
        } else{
            audioPlayer.play()
            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            sender.tintColor = .black
            
        }
    }
    
    func playThis(thisOne: String) {
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            labelName.text = songs[thisSong]
            audioPlayer.play()
        }
        catch {
            print("ERROR")
        }
        
        if audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }
    
    @IBAction func buttonNextSong(_ sender: Any) {
        

        if thisSong < songs.count - 1 {
            thisSong += 1
            playThis(thisOne: songs[thisSong])

        } else {
            
        }
        
    }
    
    @IBAction func buttonPrev(_ sender: Any) {
        
        if thisSong != 0 {
            thisSong -= 1
            playThis(thisOne: songs[thisSong])

        } else {
        
     }
    }
}
