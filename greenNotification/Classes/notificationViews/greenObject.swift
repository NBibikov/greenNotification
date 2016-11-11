//
//  greenObject.swift
//  CustomPopUp
//
//  Created by Nick Bibikov on 11/4/16.
//  Copyright © 2016 Nick Bibikov. All rights reserved.
//

import UIKit

class greenObject: NSObject
{
    public static func initString(stringTitle: String!, stringFont: UIFont?, stringColor: UIColor?) -> (NSAttributedString)
    {
        var multipleAttributes = [String : Any]()
        
        if let stringFont = stringFont { multipleAttributes[NSFontAttributeName] = stringFont }
        if let stringColor = stringColor { multipleAttributes[NSForegroundColorAttributeName] = stringColor }
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        multipleAttributes[NSParagraphStyleAttributeName] = style
        
        let string = NSAttributedString.init(string: stringTitle, attributes: multipleAttributes)
        
        return string
    }
    
    public static func initButton(buttonTitle: String!, titleFont: UIFont?, cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?, bgColor: UIColor?) -> (UIButton)
    {
        let button = UIButton.init()
        
        button.setTitle(buttonTitle, for: [.normal])
        
        if bgColor == nil {button.setTitleColor(UIColor.darkGray, for: [.normal])}
        if let titleFont = titleFont { button.titleLabel!.font = titleFont }
        if let cornerRadius = cornerRadius { button.layer.cornerRadius = cornerRadius }
        if let borderWidth = borderWidth { button.layer.borderWidth = borderWidth }
        if let borderColor = borderColor { button.layer.borderColor = borderColor.cgColor }
        if let bgColor = bgColor { button.backgroundColor = bgColor }
        
        button.layer.masksToBounds = true
        
        return button
    }
}

