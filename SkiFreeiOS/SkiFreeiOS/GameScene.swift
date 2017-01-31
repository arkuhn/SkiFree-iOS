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
        
        //Skier - soon to be its own class
        skier = SKSpriteNode(color: UIColor.red, size: CGSize(width: 40, height: 40))
        skier.position = CGPoint(x: frame.width / 2, y: frame.height - 40)
        addChild(skier)
        
        //Skier physics
        skier.physicsBody = SKPhysicsBody(rectangleOf: skier.size)
        skier.physicsBody?.allowsRotation = false
        skier.physicsBody?.angularDamping = 0
        skier.physicsBody?.linearDamping = 0
        skier.physicsBody?.restitution = 0 //doesnt bounce :(
        skier.physicsBody?.friction = 0
        
        
        //Confine Skier (Border physics)
        let borderBounds = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBounds.friction = 0
        self.physicsBody = borderBounds
    
    }
    
}
