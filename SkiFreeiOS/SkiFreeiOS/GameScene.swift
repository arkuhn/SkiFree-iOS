//
//  GameScene.swift
//  SkiFreeiOS
//
//  Created by Lenel on 1/31/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var background: SKSpriteNode?
    var skier = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //Background
        background = SKSpriteNode(color: UIColor.white , size: self.frame.size)
        background?.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(background!)
        
        //Skier
        let skier = Skier()
        skier.position = CGPoint(x: frame.width / 2, y: frame.height - 40)
        addChild(skier)
        
        //Confine Skier (Border physics)
        let borderBounds = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBounds.friction = 0
        self.physicsBody = borderBounds
    
    }
    
}
