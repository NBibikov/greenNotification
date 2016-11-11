//
//  greenNotification.swift
//  CustomPopUp
//
//  Created by Nick Bibikov on 11/2/16.
//  Copyright © 2016 Nick Bibikov. All rights reserved.
//

import UIKit


class greenNotification: NSObject
{
    
    
    public static func showNotification(title: NSAttributedString?, message: NSAttributedString?, titleImage : UIImage?, completion: completionHandler?) -> ()
    {
        greenNotification.initNewWindowWithView(titleValue: title, messageValue: message, imageValue: titleImage, buttonsArray: nil, completionValue: completion)
    }
    
    public static func showNotificationWithButtons(title: NSAttributedString, message: NSAttributedString, titleImage : UIImage?, buttons: Array<UIButton>?, completion:completionHandler!) -> ()
    {
        greenNotification.initNewWindowWithView(titleValue: title, messageValue: message, imageValue: titleImage, buttonsArray: buttons, completionValue: completion)
    }
    
    public static func showNotificationWithView(mainView: UIView, completion:completionHandler?) -> ()
    {
        greenNotification.initNewWindowWithView(mainView: mainView, completionValue: completion)
    }
    
    
    private static func initNewWindowWithView(titleValue: NSAttributedString?, messageValue: NSAttributedString?, imageValue : UIImage?, buttonsArray: Array<UIButton>?, completionValue: completionHandler?) -> ()
    {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindowLevelAlert;
        let controller = UIViewController()
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        let greenController = greenViewController()
        greenController.titleTextValue = titleValue
        greenController.notiticationTextValue = messageValue
        greenController.buttonsArray = buttonsArray
        greenController.handler = completionValue
        
        if let imageValue = imageValue { greenController.titleImageValue = imageValue }
        
        controller.present(greenController, animated: false, completion: nil)
    }
    
    private static func initNewWindowWithView(mainView: UIView!, completionValue: completionHandler?) -> ()
    {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindowLevelAlert;
        let controller = UIViewController()
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        let greenController = greenViewController()
        
        greenController.mainView = mainView
        greenController.handler = completionValue
        
        controller.present(greenController, animated: false, completion: nil)
    }
}


