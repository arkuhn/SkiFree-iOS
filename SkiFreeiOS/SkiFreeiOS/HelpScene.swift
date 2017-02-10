//
//  HelpScene.swift
//  SkiFreeiOS
//
//  Created by Lenel on 2/10/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit

class HelpScene: SKScene{
    
    //Title
    var gameTitleLabel = SKLabelNode()
    
    //Back button
    var backButton = SKLabelNode()
    var lastPosition = CGPoint()
    
    //Body text
    var bodyArray = Array<SKLabelNode>()
    
    
    override func didMove(to view: SKView) {
        
        lastPosition = CGPoint(x: frame.width/2, y: frame.height * 2 / 3)
        
        //Title
        gameTitleLabel.text = "Welcome to Ski Free!"
        gameTitleLabel.name = "titleNode"
        gameTitleLabel.color = UIColor.blue
        gameTitleLabel.position = CGPoint(x: self.frame.width / 2, y: frame.height * 8 / 9 )
        
        //Body
        let bodyText1a = SKLabelNode(text: "- Tap towards the center of the screen")
        let bodyText1b = SKLabelNode(text: "to repeatedly to push yourself")
        let bodyText1c = SKLabelNode(text: "down the mountain")
        
        let bodySpace = SKLabelNode(text: " ")
        
        let bodyText2a = SKLabelNode(text: "- Tap towards the left and the right of")
        let bodyText2b = SKLabelNode(text: "screen to avoid obstacles")
        
        let bodySpace2 = SKLabelNode(text: " ")
        
        let bodyText3a = SKLabelNode(text: "- Beware the Yeti!")
        
        bodyArray = [bodyText1a, bodyText1b, bodyText1c, bodySpace, bodyText2a, bodyText2b, bodySpace2, bodyText3a]
        configureBody()
        
        //Back button
        backButton.text = "Go back"
        backButton.name = "backNode"
        backButton.color = UIColor.blue
        backButton.position = CGPoint(x: self.frame.width / 2, y: frame.height / 9 )
        
        
        for label in bodyArray{
            addChild(label)
        }
        addChild(gameTitleLabel)
        addChild(backButton)
        
    }
    
    func configureBody(){
        for label in bodyArray{
            label.color = UIColor.blue
            label.fontSize = 24
            label.position = lastPosition
            lastPosition = CGPoint(x: lastPosition.x, y: lastPosition.y - 30)

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.menuController(touches: touches)
        
    }
    
    func menuController(touches: Set<UITouch>){
        for touch in touches{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == backButton{
                let playScene = MenuScene(size: self.size)
                self.view?.presentScene(playScene, transition: SKTransition.fade(withDuration: 1))
                
            }
            
            
            
        }
    }
    
    
}
