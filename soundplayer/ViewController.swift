//
//  ViewController.swift
//  soundplayer
//
//  Created by SREEHARI MOHAN on 16/10/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
        // Do any additional setup after loading the view.
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }

    @IBOutlet weak var playPauseBtn: UIButton!
    @IBAction func playbtn(_ sender: Any) {
        
        if(audioPlayer.isPlaying == true){
            audioPlayer.stop()
//            playPauseBtn.setImage(UIImage(named: "pause.fill"), for: )
        }else{
            audioPlayer.play()
            slider.maximumValue = Float(audioPlayer.duration)
//            playPauseBtn.setImage(UIImage(named: ""), for: <#T##UIControl.State#>)
        }
        
        
        
    }
    
    @objc func updateSlider(){
        slider.value = Float(audioPlayer.currentTime)
        
    }
    @IBAction func sliderchange(_ sender: Any) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(slider.value)
        audioPlayer.play()
    }
    
}

