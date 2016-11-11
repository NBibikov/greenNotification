//
//  ViewController.swift
//  greenNotification
//
//  Created by Nick Bibikov on 11/07/2016.
//  Copyright (c) 2016 Nick Bibikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func showImageNotificationPressed(_ sender: UIButton)
    {
        let image = UIImage.init(named: "titleImage")
        
        let notificationTitleText = "Penatibus phasellus tortor"
        
        let notificationMessageText = "Penatibus phasellus tortor pulvinar consectetur nascetur ante dictum elementum mauris porta lectus, sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus felis lorem tempor erat. Nascetur ad purus vel pulvinar consectetur nascetur ante dictum elementum mauris porta lectus, sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus felis lorem tempor erat. Nascetur ad purus vel fusce luctus dapibus sed, laoreet primis eros ornare nisi montes felis hac, pellentesque id eget Penatibus phasellus tortor pulvinar consectetur nascetur++"
        
        let titleFont = UIFont (name: "AvenirNext-Bold", size: 18)
        let messageFont = UIFont (name: "AvenirNext-Regular", size: 13)
        
        let notificationTitle = greenObject.initString(stringTitle: notificationTitleText, stringFont: titleFont, stringColor: UIColor.gray)
        let notificationMessage = greenObject.initString(stringTitle: notificationMessageText, stringFont: messageFont, stringColor: UIColor.init(netHex: 0x415659))
        
        greenNotification.showNotification(title: notificationTitle, message: notificationMessage, titleImage: image!, completion: { (sender) -> Void in
            
            print("closed!")
        })
    }
    
    
    @IBAction func showCleanNotificationButtonPressed(_ sender: UIButton)
    {
        let notificationTitleText = "Penatibus phasellus tortor"
        
        let notificationMessageText = "Penatibus phasellus tortor pulvinar consectetur nascetur ante dictum elementum mauris porta lectus, sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus felis lorem tempor erat. Nascetur ad purus vel fusce luctus dapibus sed, laoreet primis eros ornare nisi montes felis hac, pellentesque id eget Penatibus phasellus tortor pulvinar consectetur nascetur ante dictum++"
        
        let titleFont = UIFont (name: "AvenirNext-Bold", size: 18)
        let messageFont = UIFont (name: "AvenirNext-Regular", size: 13)
        
        let notificationTitle = greenObject.initString(stringTitle: notificationTitleText, stringFont: titleFont, stringColor: UIColor.gray)
        let notificationMessage = greenObject.initString(stringTitle: notificationMessageText, stringFont: messageFont, stringColor: UIColor.init(netHex: 0x415659))
        
        greenNotification.showNotification(title: notificationTitle, message: notificationMessage, titleImage: nil, completion: { (sender) -> Void in
            
            print("closed!")
        })
        
    }
    
    
    @IBAction func showOneButtonNotificationButtonPressed(_ sender: UIButton)
    {
        let image = UIImage.init(named: "titleImage")
        
        let notificationTitleText = "Penatibus phasellus tortor"
        
        let notificationMessageText = "Penatibus phasellus tortor pulvinar consectetur nascetur ante dictum elementum ma sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus++"
        
        let titleFont = UIFont (name: "AvenirNext-Bold", size: 18)
        let messageFont = UIFont (name: "AvenirNext-Regular", size: 13)
        let buttonFont = UIFont (name: "AvenirNext-Regular", size: 13)
        
        let notificationTitle = greenObject.initString(stringTitle: notificationTitleText, stringFont: titleFont, stringColor: UIColor.gray)
        let notificationMessage = greenObject.initString(stringTitle: notificationMessageText, stringFont: messageFont, stringColor: UIColor.init(netHex: 0x415659))
        
        let button1 = greenObject.initButton(buttonTitle: "Ok", titleFont: buttonFont, cornerRadius: 6, borderWidth: 0.7, borderColor: UIColor.init(netHex: 0x415659), bgColor: UIColor.init(netHex: 0x415659))
        
        greenNotification.showNotificationWithButtons(title: notificationTitle, message: notificationMessage, titleImage: image, buttons: [button1], completion: { (button) -> Void in
            
            print(button?.tag ?? 900)
        })
        
        
    }
    
    @IBAction func showTwoButtonNotificationButtonPressed(_ sender: UIButton)
    {
        
        let image = UIImage.init(named: "titleImage")
        
        let notificationTitleText = "Penatibus phasellus tortor"
        
        let notificationMessageText = "Penatibus phasellus tortor pulvinar consectetur nascetur ante dictum elementum mauris porta lectus, sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus felis pulvinar consectetur nascetur ante dictum elementum mauris porta lectus, sodales nibh semper urna tellus sapien vestibulum placerat convallis varius, proin nullam at enim et cursus++"
        
        let titleFont = UIFont (name: "AvenirNext-Bold", size: 18)
        let messageFont = UIFont (name: "AvenirNext-Regular", size: 13)
        let buttonFont = UIFont (name: "AvenirNext-Regular", size: 13)
        
        let notificationTitle = greenObject.initString(stringTitle: notificationTitleText, stringFont: titleFont, stringColor: UIColor.gray)
        let notificationMessage = greenObject.initString(stringTitle: notificationMessageText, stringFont: messageFont, stringColor: UIColor.init(netHex: 0x415659))
        
        let button1 = greenObject.initButton(buttonTitle: "Ok", titleFont: buttonFont, cornerRadius: 6, borderWidth: 0.7, borderColor: UIColor.init(netHex: 0x415659), bgColor: UIColor.init(netHex: 0x415659))
        let button2 = greenObject.initButton(buttonTitle: "Right", titleFont: buttonFont, cornerRadius: 6, borderWidth: 0.7, borderColor: UIColor.init(netHex: 0x415659), bgColor: UIColor.init(netHex: 0x415659))
        
        
        greenNotification.showNotificationWithButtons(title: notificationTitle, message: notificationMessage, titleImage: image, buttons: [button1, button2], completion: { (button) -> Void in
            
            print(button?.tag ?? 900)
        })
    }
    
    @IBAction func showCustomMainViewNotificationButtonPressed(_ sender: UIButton)
    {
     
        let mainView = Bundle.main.loadNibNamed("customMainView", owner: nil, options: nil)?[0] as! UIView
        greenNotification.showNotificationWithView(mainView: mainView, completion: { (sender) -> Void in
            
            print("closed!")
        })

    }
    
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
