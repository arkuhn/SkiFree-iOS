//
//  Obstacle.swift
//  SkiFreeiOS
//
//  Created by ark9719 on 2/7/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit


class Obstacle: SKSpriteNode{
    
    let textureArray: [SKTexture] = [SKTexture(imageNamed: "skifreetree"),
                                     SKTexture(imageNamed: "skifreetree2"),
                                     SKTexture(imageNamed: "skifreetree3"),
                                     SKTexture(imageNamed: "skifreetree4"),
                                     SKTexture(imageNamed: "skifreestump"),
                                     SKTexture(imageNamed: "skifreemushroom"),
                                     SKTexture(imageNamed: "skifreerock") ]
    
    
    init (frame: CGRect) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 40, height: 40))
        getTexture()
        getSize()
        getLocation(frameOriginal: frame)
        initPhysics()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initPhysics(){
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.texture!.size())
        self.physicsBody?.isDynamic = false
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = 2
        
    }
    
    func getTexture(){
        let randomTexture = Int(arc4random_uniform(UInt32(textureArray.count)))
        self.texture = textureArray[randomTexture]
        
    }
    
    func getSize(){
        //static for now
        self.size = (self.texture?.size())!
    }
    
    func getLocation(frameOriginal: CGRect){
        let randomX = Int(arc4random_uniform(UInt32(frameOriginal.width)))
        let randomY = Int(arc4random_uniform(UInt32(frameOriginal.height * 2)))
        self.position = CGPoint(x: randomX, y: -randomY )
    }
    
    func update(scrollSpeed: Double){
        self.position = CGPoint(x: self.position.x, y: self.position.y + CGFloat(scrollSpeed))

    }
    
    
    
}
