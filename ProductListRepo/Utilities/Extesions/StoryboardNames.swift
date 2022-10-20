//
//  StoryboardNames.swift
//  Base
//
//  Created by approc on 7/4/20.
//  Copyright © 2020 approc. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardNames: String{
    
    case Main = "Main"
    case Tutorial = "Tutorial"
    
    var instance: UIStoryboard{
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
extension UIViewController{
    
    class var storyboardID: String{
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: StoryboardNames) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
