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
        super.init(texture: nil, color: UIColor.red, size: CGSize(width: 40, height: 40))
        setPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhysics(){
        //Skier physics
        skierPhysics = SKPhysicsBody(rectangleOf: size)
        skierPhysics?.allowsRotation = false
        skierPhysics?.angularDamping = 0
        skierPhysics?.linearDamping = 0
        skierPhysics?.restitution = 0 //doesnt bounce :(
        skierPhysics?.friction = 0
        physicsBody = skierPhysics
    }
    
    func setPosition(){
        
    }
    
}
