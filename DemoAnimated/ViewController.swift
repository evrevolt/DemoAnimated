//
//  ViewController.swift
//  DemoAnimated
//
//  Created by Геннадий Ведерников on 01.11.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    
    @IBOutlet var animatedView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    override func viewDidLoad() {
        animatedView.layer.cornerRadius = 10
        getAnimated()
        super.viewDidLoad()
    }
    
    
    @IBAction func runButtonTapped(_ sender: UIButton) {
        
        let animations = getAnimated()
        
        
        springAnimationView.animate()

        sender.setTitle("Run \(animations.animation)", for: .normal)

        
    }
    
    
    func getAnimated() -> SpringView {
        
        var someAnimetion = springAnimationView
        
        let preset = AnimationPreset.allCases.randomElement()
        presetLabel.text = "preset: \(preset?.rawValue ?? "not found")"
        someAnimetion!.animation = preset?.rawValue ?? "pop"
        
        let curve = AnimationCurve.allCases.randomElement()
        curveLabel.text = "curve: \(curve?.rawValue ?? "not found")"
        someAnimetion!.curve = curve?.rawValue ?? "spring"
        
        var force = CGFloat.random(in: 0...2)
        force = round(force * 10) / 10
        forceLabel.text = "fonce: \(force)"
        someAnimetion!.force = force
        
        var duration = CGFloat.random(in: 0...2)
        duration = round(force * 10) / 10
        durationLabel.text = "duration: \(duration)"
        someAnimetion!.duration = duration
        
        var delay = CGFloat.random(in: 0...2)
        delay = round(delay * 10) / 10
        delayLabel.text = "delay: \(delay)"
        someAnimetion!.delay = delay
        
        return someAnimetion!
        
    }
    

}

