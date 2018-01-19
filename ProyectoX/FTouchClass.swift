//
//  FTouchClass.swift
//  ProyectoX
//
//  Created by Ricardo Ramirez on 1/18/18.
//  Copyright © 2018 Alejandro. All rights reserved.
//

import UIKit

import SpriteKit
import CoreMotion
class FTouchClass: UIView {

    
    var size:CGFloat = 0
    var asteroide = SKSpriteNode()
    
    func crearAsteroide()
    {
        asteroide = SKSpriteNode(imageNamed: "asteroide")
        asteroide.setScale(0.5)
        asteroide.position = CGPoint(x: 0, y: 0)
        let imageView = SKView()
        let scene = SKScene(size: imageView.frame.size)
        scene.backgroundColor = SKColor.clear
        scene.addChild(asteroide)

    }
    

        override func touchesBegan(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
            handleTouch(touches)
        }
        
        override func touchesMoved(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
            handleTouch(touches)
        }
        
        override func touchesEnded(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
            size = 0
            self.setNeedsDisplay()
        }
        
        func handleTouch(_ touches:Set<UITouch>) {
            let touch = touches.first
            size = touch!.force * 100
            asteroide.position = CGPoint(x: size, y: 0)
            self.setNeedsDisplay()
    }
        
        

}
