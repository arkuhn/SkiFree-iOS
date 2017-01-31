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
    var background1 = SKSpriteNode()
    var background2 = SKSpriteNode()
    var skier = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        anchorPoint = CGPoint(x: 0, y: 0)
        
        //Background
        background1 = SKSpriteNode(imageNamed: "background1")
        background2 = SKSpriteNode(imageNamed: "background2")
        background1.size = frame.size
        background2.size = frame.size
        
        background1.position = CGPoint(x: frame.width / 2, y: frame.height / 2 )
        background2.position = CGPoint(x: frame.width / 2, y: frame.height * 2 - frame.height/2)
        
        addChild(background1)
        addChild(background2)
        
        
        //Skier
        let skier = Skier()
        skier.position = CGPoint(x: frame.width / 2, y: frame.height - 40)
        addChild(skier)
        
        //Confine Skier (Border physics)
        let borderBounds = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBounds.friction = 0
        self.physicsBody = borderBounds
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.moveBackground()
    }
    
    func moveBackground(){
        if (background1.position.y <= -background1.size.height / 2){
            background1.position = CGPoint(x: frame.width / 2, y: frame.height * 2 - frame.height/2 - 4)
        }
        
        print(background1.position.y)
        if (background2.position.y <= -background1.size.height / 2){
            background2.position = CGPoint(x: frame.width / 2, y: frame.height * 2 - frame.height/2 - 4)
            
        }
        
        background1.position = CGPoint(x: background1.position.x, y: background1.position.y - 4)
        background2.position = CGPoint(x: background2.position.x, y: background2.position.y - 4)
        
        
}

}
