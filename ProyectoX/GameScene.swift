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
func createRandomSprite() -> SKSpriteNode
{
    let sprite = SKSpriteNode()
    let miSpriteRandomPosicion = GKRandomDistribution(lowestValue: -180, highestValue: 180)

    let posicionObstaculo  = CGFloat(miSpriteRandomPosicion.nextInt())
    sprite.position = CGPoint(x: posicionObstaculo, y: 800)
    sprite.size = CGSize(width: 80, height: 20)
    sprite.color = UIColor.white
    sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
    sprite.physicsBody?.affectedByGravity = true
    sprite.physicsBody?.categoryBitMask = CuerpoFisico.obstaculo
    sprite.physicsBody?.collisionBitMask = CuerpoFisico.bolaBlanca
    sprite.physicsBody?.contactTestBitMask = CuerpoFisico.bolaBlanca
    sprite.physicsBody?.isDynamic = true
    return sprite
}

struct CuerpoFisico
{
    static let obstaculo : UInt32 = 0x1 << 0
    static let bolaBlanca : UInt32 = 0x1 << 1
}
class GameScene: SKScene, SKPhysicsContactDelegate {
    var fuerza = CGFloat()
    private var bolaBlanca = SKSpriteNode()
    private var enemigo = SKSpriteNode()
    private var initialPlayerPosition : CGPoint!
    private var touch = UITouch()
    private var location = CGPoint()
    private var bool = false
    var arrayDeBarras = [SKSpriteNode()]
    func crearBola()
    {
        bolaBlanca = SKSpriteNode(color: UIColor.white, size: CGSize(width: 50, height: 50))
        bolaBlanca.position = CGPoint(x: -300, y: -550)
        bolaBlanca.physicsBody = SKPhysicsBody(rectangleOf: bolaBlanca.size)
        bolaBlanca.physicsBody?.categoryBitMask = CuerpoFisico.bolaBlanca
        bolaBlanca.physicsBody?.collisionBitMask = CuerpoFisico.obstaculo
        bolaBlanca.physicsBody?.contactTestBitMask = CuerpoFisico.obstaculo
        bolaBlanca.physicsBody?.isDynamic = false
        self.addChild(bolaBlanca)
    }
    
    
    override func sceneDidLoad()
    {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        backgroundColor = UIColor.black
        crearBola()
        enemigo = createRandomSprite()
        self.addChild(enemigo)
//
//        let spawn = SKAction.run({
//            ()
//            self.enemigo.removeFromParent()
//            self.crearObstaculosMain()
//        })
//        self.addChild(enemigo)
//
//        let delayObstaculos = SKAction.wait(forDuration: 5)
//        let spawnDelay = SKAction.sequence([spawn, delayObstaculos])
//        let spawnDelayForever = SKAction.repeatForever(spawnDelay)
//
//        self.run(spawnDelayForever, withKey: "obstaculos")
        
        let animacionObstaculo = 5
        var  arrayDeObstaculos = [SKAction]()
        arrayDeObstaculos.append(SKAction.move(by: CGVector(dx:0, dy: -1000), duration: TimeInterval( animacionObstaculo)))
        arrayDeObstaculos.append(SKAction.removeFromParent())
        enemigo.run(SKAction.sequence(arrayDeObstaculos))
        
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
                bolaBlanca.position = CGPoint(x: bolaBlanca.position.x + fuerza * 7 , y: bolaBlanca.position.y)
            }
            else if (location.x > 0 && bolaBlanca.position.x > -300 )
            {
                bolaBlanca.position = CGPoint(x: bolaBlanca.position.x - fuerza * 7 , y: bolaBlanca.position.y)
            }
      
    }
    
    override func update(_ currentTime: TimeInterval) {
     
    }
    func didBegin(_ contact: SKPhysicsContact)
    {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        if firstBody.categoryBitMask == CuerpoFisico.bolaBlanca && secondBody.categoryBitMask == CuerpoFisico.obstaculo ||
            firstBody.categoryBitMask == CuerpoFisico.obstaculo && secondBody.categoryBitMask == CuerpoFisico.bolaBlanca
        {
            print("Tocados")
        }
       
    }
    func crearObstaculosMain()
    {
        self.enemigo = createRandomSprite()
        self.addChild(enemigo)
    }
}

