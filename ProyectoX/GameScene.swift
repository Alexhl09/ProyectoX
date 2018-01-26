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
    private var label = SKLabelNode()
    private var numero = CGFloat()
    private var bolaBlanca = SKSpriteNode()
    private var initialPlayerPosition : CGPoint!
    
//    private var bolaAzul = SKSpriteNode()
    
    func crearBola()
    {
        bolaBlanca = SKSpriteNode(color: UIColor.white, size: CGSize(width: 50, height: 50))
        bolaBlanca.position = CGPoint(x: -200, y: -150)
        self.addChild(bolaBlanca)
    }
//    func crearBolaAzul()
//    {
//        bolaAzul = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 50))
//        bolaAzul.position = CGPoint(x: -300, y: -50)
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
    override func didSimulatePhysics() {
        
    }

    
    //Las funciones de abajo son necesarias para hacer funcionar el 3D touch
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
    }
    func handleTouch(_ touches:Set<UITouch>) {
        let touch = touches.first
        fuerza = touch!.force

    }
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        handleTouch(touches)
       
        if(fuerza >= 1.5)
        {
        bolaBlanca.position = CGPoint(x: bolaBlanca.position.x + fuerza, y: bolaBlanca.position.y)
        }
        else
        {
        }
        bolaBlanca.position = CGPoint(x: bolaBlanca.position.x - numero, y: bolaBlanca.position.y)

    }
    
    override func update(_ currentTime: TimeInterval) {
     
    }
    
}

