//
//  Cloud.swift
//  WarFly
//
//  Created by Сергей Цыганков on 10.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//


import SpriteKit
import GameplayKit


final class Cloud: SKSpriteNode, GameBackgroundSpriteble {
    
    static func populate() -> Cloud {
        //выбираем какой будет остров (рандомно)
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        //делаем рандомный масштаб
        cloud.setScale(randomScaleFactor)
        //указываем позицию острова
        cloud.position = randomPoint()
        //добавляем рандома для движения над облаками (чтоб некоторые были выше самолетика)
        let distribution = GKRandomDistribution(lowestValue: 19, highestValue: 21)
        let randomNumber = CGFloat(distribution.nextInt())
        //находимся над фоном (чтоб летели над ними)
        cloud.zPosition = randomNumber //10 - было
        cloud.run(move(from: cloud.position))
        
        return cloud
    }
    
    static func populate(at point: CGPoint) -> Cloud {
           //выбираем какой будет остров (рандомно)
           let cloudImageName = configureName()
           let cloud = Cloud(imageNamed: cloudImageName)
           //делаем рандомный масштаб
           cloud.setScale(randomScaleFactor)
           //указываем позицию острова
           cloud.position = point
           //добавляем рандома для движения над облаками (чтоб некоторые были выше самолетика)
           let distribution = GKRandomDistribution(lowestValue: 19, highestValue: 21)
           let randomNumber = CGFloat(distribution.nextInt())
           //находимся над фоном (чтоб летели над ними)
           cloud.zPosition = randomNumber //10 - было
           cloud.run(move(from: cloud.position))
           
           return cloud
       }
    
    fileprivate static func configureName() -> String {
        //делаем рандомный остров
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        // тут генерируется само число и его можем менять
        let randomNumber = distribution.nextInt()
        let imageName = "cl\(randomNumber)"
        return imageName
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        //создаем рандомное число (для этого импортируем второй фреймворк)
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        // тут генерируется само число и его можем менять
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        return randomNumber
    }
    
    //делаем метод для движения облаков
      fileprivate static func move(from point: CGPoint) -> SKAction {
          //при движении наша координата не должна изменяться
          let movePoint = CGPoint(x: point.x, y: -200)
          //находим дистанцию
          let moveDistance = point.y + 200
          let movementSpeed: CGFloat = 150.0
          //продолжительность
          let duration = moveDistance / movementSpeed
          
          return SKAction.move(to: movePoint, duration: TimeInterval(duration))
      }
    
}
