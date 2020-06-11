//
//  PlayerPlane.swift
//  WarFly
//
//  Created by Сергей Цыганков on 11.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import SpriteKit

class PlayerPlane: SKSpriteNode {

    static func populate(at point: CGPoint) -> SKSpriteNode {
        //текстура удобней тем, что текстура меняется, а изображение нет
        let playerPlaneTexture = SKTexture(imageNamed: "airplane_3ver2_13")
        //далее перетаскиваем наши фото с самолетиком (папку написать через .atlas)
        //синяя папка представляет атлас текстур, они будут рабоать как анимация
        //название берется из текстуры
        
        //добавляем нашу текстру
        let playerPlane = SKSpriteNode(texture: playerPlaneTexture)
        //делаем рисунок в 2 раза меньше
        playerPlane.setScale(0.5)
        //размещаем самолет
        playerPlane.position = point
        playerPlane.zPosition = 20
        
        return playerPlane
    }
    
    
}
