//
//  Skier.swift
//  SkiFreeiOS
//
//  Created by Lenel on 1/31/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit


class Skier: SKSpriteNode{
    
    var skierPhysics: SKPhysicsBody?
    
    init () {
        let texture = SKTexture(imageNamed: "skiforward")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        //super.init(texture: nil, color: UIColor.red, size: CGSize(width: 40, height: 40))
        setPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhysics(){
        //Skier physics
        skierPhysics = SKPhysicsBody(rectangleOf: size)
        skierPhysics?.collisionBitMask = 0
        skierPhysics?.contactTestBitMask = 1
        skierPhysics?.allowsRotation = false
        skierPhysics?.angularDamping = 0
        //skierPhysics?.affectedByGravity = false
        skierPhysics?.linearDamping = 0
        skierPhysics?.restitution = 0 //doesnt bounce :(
        skierPhysics?.friction = 0
        physicsBody = skierPhysics
        
    }
    
    func move(direction: String){
        
        switch direction{
            
        case "left":
            self.texture = SKTexture(imageNamed: "skileft")
            self.skierPhysics?.applyImpulse(CGVector(dx: -4, dy: 0) , at: self.position)
            break
        case "right":
            self.texture = SKTexture(imageNamed: "skiright")
            self.skierPhysics?.applyImpulse(CGVector(dx: 4, dy: 0) , at: self.position)
            break
        case "down":
            self.texture = SKTexture(imageNamed: "skiforward")
            self.skierPhysics?.applyForce(CGVector(dx:0, dy: -250), at: self.position)
        default:
            break
        }
    
    }
    
}
