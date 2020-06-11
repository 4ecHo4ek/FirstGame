//
//  GameViewController.swift
//  WarFly
//
//  Created by Сергей Цыганков on 10.06.2020.
//  Copyright © 2020 Сергей Цыганков. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            //так как скс файл был удален, то создаем то же самое, но для файла свит, ибо
            //удаленные файлы нужны для того, чтоб в них рисовать, мы же будем все делавть через код
            //создаем сцену для того, чтоб на ней было все действие (как tableView)
            //указываем у него размеры для того
            let scene = GameScene(size: self.view.bounds.size)
            
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
           
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
