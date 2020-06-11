//
//  GameBackgroundSpritable+ExtensionProtocol.swift
//  WarFly
//
//  Created by Сергей Цыганков on 11.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import SpriteKit
import  GameplayKit

//создаем протокол под который будем подписывать наши классы облаков и
protocol GameBackgroundSpriteble { //делаем названия прилагательными
    static func populate() -> Self //пишем Self для того чтоб
    static func randomPoint() -> CGPoint
}

//вносим расширения для генерации новых деталей
extension GameBackgroundSpriteble {
    static func randomPoint() -> CGPoint {
        //находим границы экрана
        let screen = UIScreen.main.bounds
        // создаем рандом
        let distridution = GKRandomDistribution(lowestValue:
                                                Int(screen.size.height) + 100,
                                                highestValue: Int(screen.size.height) + 200)
        //next используется для того, чтоб мы могли генерировать значения
        let y = CGFloat(distridution.nextInt())
        //в этом рандоме меняем от 0 до нужной границы
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
        
        return CGPoint(x: x, y: y)
    }
}

