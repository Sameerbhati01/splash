//
//  ViewController.swift
//  splash
//
//  Created by Sameer Bhati on 16/07/25.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var splashView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        playGIF()
    }
    
    func playGIF() {
        do {
            let gif = try UIImage(gifName: "sorry.gif")
            let gifManager = SwiftyGifManager(memoryLimit: 20)
            imgVideo.setGifImage(gif, manager: gifManager, loopCount: -1)
        } catch {
            print("GIF not found or failed to load")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //LocationManager.sharedInstance.startUpdatingLocation()
            let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

