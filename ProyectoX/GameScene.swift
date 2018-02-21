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


class GameScene: SKScene, SKPhysicsContactDelegate {
    var fuerza = CGFloat()
    private var bolaBlanca = SKSpriteNode()
    private var initialPlayerPosition : CGPoint!
    private var bolaAzul = SKSpriteNode()
    private var touch = UITouch()
    private var location = CGPoint()
    func crearBola()
    {
        bolaBlanca = SKSpriteNode(color: UIColor.white, size: CGSize(width: 50, height: 50))
        bolaBlanca.position = CGPoint(x: -300, y: -550)
        self.addChild(bolaBlanca)
    }
//    func crearBolaAzul()
//    {
//        bolaAzul = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 50))
//        bolaAzul.position = CGPoint(x: 0, y: 0)
//        bolaAzul.physicsBody = SKPhysicsBody(rectangleOf: bolaAzul.size)
//        bolaAzul.physicsBody?.affectedByGravity = true
//        bolaAzul.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
//        self.addChild(bolaAzul)
//    }
    
    override func sceneDidLoad()
    {
        backgroundColor = UIColor.black
        crearBola()
//        crearBolaAzul()
    }
    override func willMove(from: SKView)
    {
    }
    override func didMove(to: SKView)
    {
    }
    override func didSimulatePhysics()
    {
    }

    
    //Las funciones de abajo son necesarias para hacer funcionar el 3D touch
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
        location = touch.location(in: self)
    }
    func handleTouch(_ touches:Set<UITouch>) {
        touch = touches.first!
        fuerza = touch.force
    }
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
    }
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
        
        
            if (location.x < 0  && bolaBlanca.position.x < 300 )
            {
                bolaBlanca.position = CGPoint(x: bolaBlanca.position.x + fuerza * 5 , y: bolaBlanca.position.y)
            }
            else if (location.x > 0 && bolaBlanca.position.x > -300 )
            {
                bolaBlanca.position = CGPoint(x: bolaBlanca.position.x - fuerza * 5 , y: bolaBlanca.position.y)
            }
      
    }
    
    override func update(_ currentTime: TimeInterval) {
     
    }
    
}

