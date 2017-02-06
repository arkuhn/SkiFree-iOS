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
    var touchZone = SKSpriteNode()
    var skier = Skier()
    var distance = 0
    var distanceNode = SKLabelNode()
    
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
        
        //Touchzone
        touchZone = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: frame.height / 6))
        touchZone.position = CGPoint(x: frame.width / 2 , y: frame.height / 10)
        addChild(touchZone)
        
        //Skier
        skier.position = CGPoint(x: frame.width / 2, y: frame.height - 40)
        addChild(skier)
        
        //Distance traveled 
        distanceNode.fontColor = UIColor.gray
        distanceNode.position = CGPoint(x: frame.width / 5, y: 14 * frame.height / 15 )
        distanceNode.fontSize = 20
        addChild(distanceNode)
        
        //Confine Skier (Border physics)
        let borderBounds = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBounds.friction = 0
        self.physicsBody = borderBounds
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.moveBackground()
        self.distance += 1
        self.distanceNode.text = ("Distance: \(distance)")
        skier.gravity()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == touchZone {
                skier.skierPhysics?.applyForce(CGVector(dx: 0, dy: 500), at: skier.position)
            }
            if(pos.x < frame.width / 3 ){
                skier.moveHorizontal(direction: "left")
            }
            if(pos.x > 2 * frame.width / 3){
                skier.moveHorizontal(direction: "right")
            }
            
        }
    }
    
    func slowSkier(){
        
    }
    func moveBackground(){
        
        if (background1.position.y <= -background1.size.height / 2){
            background1.position = CGPoint(x: frame.width / 2, y: background2.position.y + frame.height)
            return
        }
        
        background1.position = CGPoint(x: background1.position.x, y: background1.position.y - 6)
        
        
        if (background2.position.y <= -background1.size.height / 2){
            background2.position = CGPoint(x: frame.width / 2, y: background1.position.y + frame.height)
            return
            
        }
        
        background2.position = CGPoint(x: background1.position.x, y: background2.position.y - 6)

        
        //background2.position = CGPoint(x: background2.position.x, y: background2.position.y)
        
        
}

}
