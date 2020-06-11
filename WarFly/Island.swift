//
//  Ilands.swift
//  WarFly
//
//  Created by Сергей Цыганков on 10.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpriteble {
    
    static func populate() -> Island {
        //выбираем какой будет остров (рандомно)
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        //делаем рандомный масштаб
        island.setScale(randomScaleFactor)
        //указываем позицию острова
        island.position = randomPoint()
        //находимся над фоном (чтоб летели над ними)
        island.zPosition = 1
        //поворачиваем
        island.run(rotateForRundomAngle())
        //вызываем движение островов
        island.run(move(from: island.position))
        return island
    }
    
    static func populate(at point: CGPoint) -> Island {
           //выбираем какой будет остров (рандомно)
           let islandImageName = configureName()
           let island = Island(imageNamed: islandImageName)
           //делаем рандомный масштаб
           island.setScale(randomScaleFactor)
           //указываем позицию острова
           island.position = point
           //находимся над фоном (чтоб летели над ними)
           island.zPosition = 1
           //поворачиваем
           island.run(rotateForRundomAngle())
           //вызываем движение островов
           island.run(move(from: island.position))
           return island
       }
    
    
    
    fileprivate static func configureName() -> String {
        //делаем рандомный остров
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        // тут генерируется само число и его можем менять
        let randomNumber = distribution.nextInt()
        let imageName = "is\(randomNumber)"
        return imageName
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        //создаем рандомное число (для этого импортируем второй фреймворк)
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        // тут генерируется само число и его можем менять
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        return randomNumber
    }
    
    fileprivate static func rotateForRundomAngle() -> SKAction {
        
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        //вращение нашего острова (в радианах)
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
    }
    
    
    //делаем метод для движения облаков
    fileprivate static func move(from point: CGPoint) -> SKAction {
        //при движении наша координата не должна изменяться
        let movePoint = CGPoint(x: point.x, y: -200)
        //находим дистанцию
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 100.0
        //продолжительность
        let duration = moveDistance / movementSpeed
        
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
    
    
    
}
