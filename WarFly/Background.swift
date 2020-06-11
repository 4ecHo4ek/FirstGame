//
//  Background.swift
//  WarFly
//
//  Created by Сергей Цыганков on 10.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//



//класс для добавления фона нашей игры
//создаем ккотачкласс и затем уже выбираем класс SKSpriteNode
import SpriteKit

class Background: SKSpriteNode {

    //статик означает что функция используется самим классом или структурой
    //но их нельзя перезаписывать
    static func populatesBackground(at point: CGPoint) -> Background {
        
        let backgtound = Background(imageNamed: "background")
        //устанавливаем точку для изображения фона
        backgtound.position = point
        //указываем позицию для того, чтоб компилятор понимал на какой позиции по оси z должен находиться объект
        //более высокий объект будет проходить над более низким
        //соответсвенно фон будет самым низким
        backgtound.zPosition = 0
        
        return backgtound
    }
    
    
}
