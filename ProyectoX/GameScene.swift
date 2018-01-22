//
//  GameScene.swift
//  ProyectoX
//
//  Created by Alejandro on 12/01/18.
//  Copyright © 2018 Alejandro. All rights reserved.
//

import SpriteKit
import UIKit
import GameplayKit

class GameScene: SKScene {

    var fuerza = CGFloat()
    private var asteroide = SKSpriteNode()
    private var label = SKLabelNode()
    func crearAsteoride()
    {
    asteroide = SKSpriteNode(imageNamed: "asteroide")
    asteroide.setScale(0.1)
    asteroide.position = CGPoint(x: -300, y: 0)
    self.addChild(asteroide)
    }
    func crearLabel()
    {
        asteroide.size = CGSize(width: 30, height: 30)
        asteroide.position = CGPoint(x: 0, y: 0)
        self.addChild(asteroide)
    }
  
    override func sceneDidLoad()
    {
        crearAsteoride()
  
    }
    override func willMove(from: SKView)
    {
        
    }
    override func didMove(to: SKView)
    {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
    }
    func handleTouch(_ touches:Set<UITouch>) {
        let touch = touches.first
        fuerza = touch!.force * 5

    }
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        asteroide.position = CGPoint( x: -300 , y: 0)
    }
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
        asteroide.position = CGPoint(x: asteroide.position.x + fuerza , y: asteroide.position.y)
    }
    override func update(_ currentTime: TimeInterval) {
    
        
    }
    
}

