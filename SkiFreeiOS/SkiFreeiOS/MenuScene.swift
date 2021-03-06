//
//  MenuSceneController.swift
//  SkiFreeiOS
//
//  Created by ark9719 on 1/31/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit

class MenuScene: SKScene{
    
    //Title
    var gameTitleLabel = SKLabelNode()
    
    //Play button
    var playButton = SKLabelNode()
    
    //Help menu
    var helpButton = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        //Title
        gameTitleLabel.text = "Ski Free iOS"
        gameTitleLabel.name = "titleNode"
        gameTitleLabel.color = UIColor.blue
        gameTitleLabel.position = CGPoint(x: self.frame.width / 2, y: frame.height * 2 / 3 )
        
        //Play
        playButton.text = "play"
        playButton.name = "playNode"
        playButton.color = UIColor.blue
        playButton.position = CGPoint(x: self.frame.width / 2, y: frame.height / 3)
        
        //How to
        helpButton.text = "help"
        helpButton.name = "helpNode"
        helpButton.color = UIColor.blue
        helpButton.position = CGPoint(x: playButton.position.x, y: frame.height / 3 - 70)
        
        self.addChild(gameTitleLabel)
        self.addChild(playButton)
        self.addChild(helpButton)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.menuController(touches: touches)
        
    }
    
    func menuController(touches: Set<UITouch>){
        for touch in touches{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton{
                let playScene = GameScene(size: self.size)
                self.view?.presentScene(playScene, transition: SKTransition.fade(withDuration: 1))
                
            }
            
            if node == helpButton{
                let helpScene = HelpScene(size: self.size)
                self.view?.presentScene(helpScene, transition: SKTransition.fade(withDuration: 1))
            }
            
            
            
        }
    }
    
    
}
