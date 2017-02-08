//
//  GameOverScene.swift
//  SkiFreeiOS
//
//  Created by Lenel on 2/7/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    
    //Title
    var gameOver = SKLabelNode()
    var highScore = SKLabelNode()
    

    
    override func didMove(to view: SKView) {
        
        //Game over
        gameOver.text = "Game Over!"
        gameOver.name = "overNode"
        gameOver.color = UIColor.blue
        gameOver.position = CGPoint(x: self.frame.width / 2, y: frame.height * 2 / 3 )
        
        //High score
        let points = UserDefaults.standard.object(forKey: "HighestScore") as! Int
        highScore.text = ("High score: \(points)")
        highScore.name = "highNode"
        highScore.color = UIColor.blue
        highScore.position = CGPoint(x: self.frame.width / 2, y: frame.height / 3)
        
        
        self.addChild(gameOver)
        self.addChild(highScore)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let menuScene = MenuScene(size: self.size)
        self.view?.presentScene(menuScene, transition: SKTransition.fade(withDuration: 1))
        
    }
    

    
    
}
