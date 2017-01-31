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
    
    
    init () {
        super.init(texture: nil, color: UIColor.red, size: CGSize(width: 40, height: 40))
        setPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhysics(){
        //Skier physics
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.allowsRotation = false
        physicsBody?.angularDamping = 0
        physicsBody?.linearDamping = 0
        physicsBody?.restitution = 0 //doesnt bounce :(
        physicsBody?.friction = 0
    }
    
}
