//
//  ViewController.swift
//  Progressbar-App
//
//  Created by Nika Kalandia on 6.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var compImage: UIImageView!
    
    let maxTime : Float = 100.0
    var currentTime : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Açılışta fotoğrafı gizledik
        compImage.isHidden = true
        
        // Arkaplanı kodla yaptık (daha iyi)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        // Butonlara shape ekledik
        buttonOutlet.layer.cornerRadius = 17
        buttonOutlet.layer.masksToBounds = true
        
        progressbar.setProgress(0, animated: true)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        compImage.isHidden = true
        currentTime = 0
        progressLabel.text = "%\(Int(currentTime))"
        progressbar.setProgress(0, animated: true)
        perform(#selector(progressUpdate), with: nil, afterDelay: 1.0)
    }
    
    @objc func progressUpdate() {
        
        currentTime = currentTime + 1
        let deger = currentTime / 100
        
        progressbar.setProgress(deger, animated: true)
        
        if currentTime < maxTime {
            progressLabel.text = "%\(Int(currentTime))"
            perform(#selector(progressUpdate), with: nil, afterDelay: 0.05)
        }else {
            compImage.isHidden = false
            progressLabel.text = "Completed!"
        }
    }
    

}

