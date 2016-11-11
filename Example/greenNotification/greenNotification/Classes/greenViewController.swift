//
//  greenViewController.swift
//  CustomPopUp
//
//  Created by Nick Bibikov on 11/2/16.
//  Copyright © 2016 Nick Bibikov. All rights reserved.
//

import UIKit



var popUPView = UIView()

let bottomShowCenter = CGPoint (x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
let bottomHideCenter = CGPoint (x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height * 2)

class greenViewController: UIViewController
{
    
    var titleTextValue : NSAttributedString?
    var notiticationTextValue : NSAttributedString?
    var titleImageValue : UIImage?
    var buttonsArray : Array<UIButton>?
    var mainView : UIView?
    var handler : completionHandler? = nil
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.addViewNotification()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.35, delay: 0.1, options: [.curveEaseOut], animations: {
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        
        }, completion: { finished in
            self.showNotificationView()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.3, animations:{
            self.view.backgroundColor = UIColor.clear
        })
    }
    
    private func addViewNotification()
    {
        self.addTargetsForButtons()
        
        let tapOnBG = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnBackground(_:)))
        self.view.addGestureRecognizer(tapOnBG)
        
        if mainView == nil
        {
            let notificationView = viewWithHeaderImage.instanceFromNib() as! viewWithHeaderImage
            
            notificationView.setValuesForNotification(titleValue: titleTextValue, messageValue: notiticationTextValue, imageValue: titleImageValue, buttons: buttonsArray)
            notificationView.frame = CGRect(x: kLeftAndRightPadding, y: kLeftAndRightPadding, width: mainWidth - kLeftAndRightPadding * 2, height: notificationView.frame.size.height)
            notificationView.center = bottomHideCenter
            notificationView.backgroundColor = UIColor.white
            
            self.view.addSubview(notificationView)
            popUPView = notificationView
        }
        else
        {
            mainView!.frame = CGRect(x: kLeftAndRightPadding, y: kLeftAndRightPadding, width: mainWidth - kLeftAndRightPadding * 2, height: mainView!.frame.size.height)
            mainView!.center = bottomHideCenter
            
            self.view.addSubview(mainView!)
            popUPView = mainView!
        }
    }
    
    
    func addTargetsForButtons()
    {
        if let buttonsArray = buttonsArray
        {
            if buttonsArray.count > 0
            {
                for i in 0 ..< buttonsArray.count
                {
                    let button = buttonsArray[i]
                    button.tag = i;
                    button.addTarget(self, action: #selector(buttonPressedActions(button:)), for: [.touchUpInside])
                }
            }
        }
    }
    
    func buttonPressedActions(button: UIButton)
    {
        if self.handler != nil { self.handler!(button) }
        self.hideNotificationView()
    }
    
    
    func showNotificationView()
    {
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [.curveEaseIn], animations: {
            popUPView.center = bottomShowCenter
        }, completion: nil)
    }
    
    
    func hideNotificationView()
    {
        UIView.animate(withDuration: 0.35, delay: 0.2, options: [.curveEaseIn], animations: {
            
            popUPView.center = bottomHideCenter
            self.view.backgroundColor = UIColor.clear
            
        }, completion: { finished in
            
            self.dismiss(animated: true, completion:nil)
        })
    }

    
    func handleTapOnBackground(_ sender: UITapGestureRecognizer)
    {
        let point = sender.location(in: self.view)
        if (!popUPView.frame.contains(point))
        {
            if self.handler != nil { self.handler!(nil) }
            hideNotificationView()
        }
    }
    
}
