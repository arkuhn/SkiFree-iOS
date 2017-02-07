//
//  GameViewController.swift
//  SkiFreeiOS
//
//  Created by ark9719 on 1/31/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = view as! SKView
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        let scene = MenuScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        sceneView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
