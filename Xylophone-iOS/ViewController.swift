//
//  ViewController.swift
//  Xylophone-iOS
//
//  Created by Michel Jaejin Kim on 21/06/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "C" :
            playSound(chord: "C")
        case "D":
            playSound(chord: "D")
        case "E":
            playSound(chord: "E")
        case "F":
            playSound(chord: "F")
        case "G":
            playSound(chord: "G")
        case "A":
            playSound(chord: "A")
        case "B":
            playSound(chord: "B")
        default:
            print("It's some other chord")
        }
        
    }
    
    func playSound(chord: String) {
        guard let path = Bundle.main.path(forResource: chord.uppercased(), ofType: "wav") else {
            print("Arquivo de som não encontrado")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 1.0
            audioPlayer?.numberOfLoops = 0
            audioPlayer?.play()
        } catch {
            print("Erro ao reproduzir o som: \(error.localizedDescription)")
        }
    }
    
}

