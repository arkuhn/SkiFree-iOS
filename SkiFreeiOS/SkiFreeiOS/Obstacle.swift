//
//  Obstacle.swift
//  SkiFreeiOS
//
//  Created by Lenel on 2/7/17.
//  Copyright © 2017 ark9719. All rights reserved.
//

import Foundation
import SpriteKit


class Obstacle: SKSpriteNode{
    
    init (frame: CGRect) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 40, height: 40))
        getTexture()
        getSize()
        getLocation(frameOriginal: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTexture(){
        //Colors until sprites are a thing
        let colors = [ UIColor.yellow, UIColor.green, UIColor.blue ]
        let randomColor = Int(arc4random_uniform(UInt32(3)))
        self.color = colors[randomColor]
        
    }
    
    func getSize(){
        //static for now
        self.size = CGSize(width: 30, height: 30)
    }
    
    func getLocation(frameOriginal: CGRect){
        let randomX = Int(arc4random_uniform(UInt32(frameOriginal.width)))
        let randomY = Int(arc4random_uniform(UInt32(frameOriginal.height)))
        self.position = CGPoint(x: randomX, y: -randomY )
    }
    
    func update(){
        self.position = CGPoint(x: self.position.x, y: self.position.y + 10)

    }
    
    
    
}