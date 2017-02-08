//
//  GameScene.swift
//  SkiFreeiOS
//
//  Created by ark9719 on 1/31/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import SpriteKit
import UIKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background1 = SKSpriteNode()
    var background2 = SKSpriteNode()
    var touchZone = SKSpriteNode()
    var lastDistance = 0
    var skier = Skier()
    var distance = 0
    var distanceNode = SKLabelNode()
    var currentObstacles = Array<Obstacle>()
    var scrollSpeed = 6
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.physicsWorld.contactDelegate = self
        anchorPoint = CGPoint(x: 0, y: 0)
        
        initBackgrounds()
        initTouchZone()
        initWorldPhysics()
        initDistanceLabel()
        
        //Skier
        skier.position = CGPoint(x: frame.width / 2, y: frame.height - 40)
        addChild(skier)
    }
    
    //SCENE
    
    override func update(_ currentTime: TimeInterval) {
        self.moveBackground()
        self.distance += 1
        self.distanceNode.text = ("Distance: \(distance)")
        self.updateObstacles()
        self.updateScrollDifficulty()
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let overScene = GameOverScene(size: self.size)
        self.view?.presentScene(overScene, transition: SKTransition.fade(withDuration: 1))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == touchZone {

            if(pos.x < frame.width / 3 ){
                skier.move(direction: "left")
            }
            else if(pos.x > frame.width / 3 && pos.x < 2 * frame.width / 3){
                skier.move(direction: "up")
            }
            else if(pos.x > 2 * frame.width / 3){
                skier.move(direction: "right")
            }
                
            }
        }
    }
    
    
    //UTILITY 
    func updateObstacles(){
        spawnObstacles()
        moveObstacles()
    }
    
    func spawnObstacles(){
        let spawnFrequency = 100.0 - Double(distance) * 0.01
        
        if distance > lastDistance + Int(spawnFrequency) {
            
            if currentObstacles.count < 15 {
                let newObstacle = Obstacle(frame: self.frame)
                currentObstacles.append(newObstacle)
                addChild(newObstacle)
                lastDistance = distance
            }
            
        }
        
    }
    
    func moveObstacles(){
        
        for obstacle in currentObstacles{
            obstacle.update(scrollSpeed: scrollSpeed)
            
            let indexObstacle = currentObstacles.index(of: obstacle)
            if obstacle.position.y > frame.height {
                currentObstacles.remove(at: indexObstacle!)
                obstacle.removeFromParent()
            }
        }
        
    }
    
    func moveBackground(){
        
        if (background1.position.y <= -background1.size.height / 2){
            background1.position = CGPoint(x: frame.width / 2, y: background2.position.y + frame.height)
            return
        }
        
        background1.position = CGPoint(x: Int(background1.position.x), y: Int(background1.position.y) - scrollSpeed)
        
        
        if (background2.position.y <= -background1.size.height / 2){
            background2.position = CGPoint(x: frame.width / 2, y: background1.position.y + frame.height)
            return
            
        }
        
        background2.position = CGPoint(x: Int(background1.position.x), y: Int(background2.position.y) - scrollSpeed)
        
        
    }
    
    func updateScrollDifficulty(){
        if (distance % 1000 == 0){
            let advancement = distance / 1000
            scrollSpeed += advancement
        }
        
    }
    
    //INITIALIZERS
    
    func initBackgrounds(){
        //Background
        background1 = SKSpriteNode(imageNamed: "background1")
        background2 = SKSpriteNode(imageNamed: "background2")
        background1.size = frame.size
        background2.size = frame.size
        
        background1.position = CGPoint(x: frame.width / 2, y: frame.height / 2 )
        background2.position = CGPoint(x: frame.width / 2, y: frame.height * 2 - frame.height/2)
        
        addChild(background1)
        addChild(background2)
    }
    
    func initTouchZone(){
        //TouchZone
        touchZone = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: frame.height / 6))
        touchZone.position = CGPoint(x: frame.width / 2 , y: frame.height / 11)
        addChild(touchZone)
    }
    
    func initWorldPhysics(){
        //Gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        let gravityVec = vector_float3(0, -1, 0)
        let gravityNode = SKFieldNode.linearGravityField(withVector: gravityVec)
        gravityNode.strength = 2.5
        addChild(gravityNode)
        
        //Confine Skier (Border physics)
        let borderBounds = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBounds.friction = 0
        self.physicsBody = borderBounds
    }
    
    func initDistanceLabel(){
        //Distance traveled label
        distanceNode.fontColor = UIColor.gray
        distanceNode.position = CGPoint(x: frame.width / 5, y: 14 * frame.height / 15 )
        distanceNode.fontSize = 20
        addChild(distanceNode)
    }

}
