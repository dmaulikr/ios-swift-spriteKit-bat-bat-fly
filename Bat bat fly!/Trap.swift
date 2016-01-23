//
//  Trap.swift
//  Bat bat fly!
//
//  Created by Kersuzan on 21/01/2016.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

import SpriteKit

class Trap: Obstacle {
    
    var trapClosedFrame: [SKTexture] = [SKTexture]()
    
    convenience init(initWithTexture: SKTexture) {
        self.init(texture: initWithTexture)
        self.size.width = GameManager.sharedInstance.BOX_SIZE * 0.8
        self.size.height = initWithTexture.size().height * (self.size.width / initWithTexture.size().width)
        self.zPosition = 10
    }
    
    override func initPhysics() {
        self.physicsBody!.contactTestBitMask = GameManager.sharedInstance.COLLIDER_PLAYER
        self.physicsBody!.collisionBitMask = GameManager.sharedInstance.COLLIDER_PLAYER
        super.initPhysics()
    }
    
    func playTrapClosedAnimation() {
        self.removeAllActions()
        let scaleYFactor = self.trapClosedFrame[self.trapClosedFrame.count - 1].size().height / self.size.height
        let scaleXFactor = self.trapClosedFrame[self.trapClosedFrame.count - 1].size().width / self.size.width
        
        self.runAction(SKAction.animateWithTextures(self.trapClosedFrame, timePerFrame: 0.2))
        self.runAction(SKAction.scaleXTo(scaleXFactor, duration: Double(self.trapClosedFrame.count) * 0.2))
        self.runAction(SKAction.scaleYTo(scaleYFactor, duration: Double(self.trapClosedFrame.count) * 0.2))
    }
}