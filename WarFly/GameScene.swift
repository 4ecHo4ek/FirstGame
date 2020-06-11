//
//  GameScene.swift
//  WarFly
//
//  Created by Сергей Цыганков on 10.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import SpriteKit
import GameplayKit
//этот фреймворк отвечает за движение
import CoreMotion

class GameScene: SKScene {
    //эта штука отвечает за движение
    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    
    var player: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        configureStartScene()
        spawnClounds()
        
        
    }
    
    fileprivate func spawnClounds() {
        
        
        
    }
    
    
    
    
    
    fileprivate func configureStartScene() {
        //создаем центр экрана
        let screenCenterPoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        //помещаем на него наш фон
        let background = Background.populatesBackground(at: screenCenterPoint)
        //растягиваем фон по всему экрану
        background.size = self.size
        //добавляем фон на экран
        self.addChild(background)
        
        //создаем переменную размером с экран
        let screen = UIScreen.main.bounds
        
        //делаем острова и облака
        
        let island1 = Island.populate(at: CGPoint(x: 100, y: 200))
        self.addChild(island1)
        
        let island2 = Island.populate(at: CGPoint(x: self.size.width - 100, y: self.size.height - 200))
        self.addChild(island2)
        
        let cloud1 = Island.populate(at: CGPoint(x: 200, y: 100))
        self.addChild(cloud1)
        
        let cloud2 = Island.populate(at: CGPoint(x: self.size.width - 200, y: self.size.height - 100))
        self.addChild(cloud2)
        
        let cloud3 = Island.populate(at: CGPoint(x: self.size.width - 150, y: self.size.height - 300))
        self.addChild(cloud3)
        
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 200))
        self.addChild(player)
        
        //как часто нужно замерять ускорение
        motionManager.accelerometerUpdateInterval = 0.2
        //
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let data = data {
                //получаем ускорение
                let acceleration = data.acceleration
                self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
            }
        }
    }
    
    
    
    
    //добавляем физику
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        
        player.position.x += xAcceleration * 50
        
        //ограничиваем движение самолетика по экрану
        if player.position.x < -70 {
            player.position.x = self.size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
        
        
    }
}
