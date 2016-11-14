//
//  viewWithHeaderImage.swift
//  CustomPopUp
//
//  Created by Nick Bibikov on 11/2/16.
//  Copyright © 2016 Nick Bibikov. All rights reserved.
//

import UIKit

let kLeftAndRightPadding : CGFloat = 32

let mainWidth = UIScreen.main.bounds.width
let mainHeight = UIScreen.main.bounds.height

let kDefaultHeaderImageHeight : CGFloat = 130
let kContentHeight : CGFloat = 100
let kButtonsHeight : CGFloat = 64
let kVerticalMarginForMaxView : CGFloat = 100

class viewWithHeaderImage: UIView
{
    @IBOutlet weak var nImageView: UIImageView!
    @IBOutlet weak var nTitleLabel: UILabel!
    @IBOutlet weak var nTextView: UITextView!
    @IBOutlet weak var horizontalButtonsView: UIView!
    
    @IBOutlet weak var buttonViewBottom: NSLayoutConstraint!
    @IBOutlet weak var nImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var horizontalButtonsViewHeight: NSLayoutConstraint!
    
    
    var contentHeight = kContentHeight
    let buttonPadding : CGFloat = 8
    var buttonsArray: Array<UIButton>?
    
    static public func instanceFromNib() -> UIView
    {
        return UINib(nibName: "viewWithHeaderImage", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
    }
    
    public func setValuesForNotification(titleValue: NSAttributedString?, messageValue: NSAttributedString?, imageValue : UIImage?, buttons: Array<UIButton>?)
    {
        self.nTitleLabel.text = ""
        self.nTextView.text = ""
        if titleValue == nil && messageValue == nil { self.nTextView.text = "Your notification will be here if you set it" }
        
        if let titleValue = titleValue {
            self.nTitleLabel.attributedText = titleValue
            contentHeight = contentHeight + self.heightForText(attrString: titleValue)
        }
        if let messageValue = messageValue { self.nTextView.attributedText = messageValue }
        
        
        
        self.buttonsArray = buttons
        
        if let imageValue = imageValue
        {
            self.nImageView.image = imageValue
            contentHeight = contentHeight + kDefaultHeaderImageHeight
            nImageViewHeight.constant = kDefaultHeaderImageHeight
        }
        
        if buttons?.count == 1 { contentHeight = contentHeight + kButtonsHeight }
        else if buttons?.count == 2 { contentHeight = contentHeight + kButtonsHeight }
        
        self.setNeedsDisplay()
        self.updateConstraintsIfNeeded()

    }
    
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        if let buttons = self.buttonsArray
        {
            if buttons.count == 1
            {
                var centerRect = horizontalButtonsView.frame;
                centerRect.origin = CGPoint(x: 0, y:0)
                let centerButton = buttons.first
                centerButton!.frame = centerRect
                horizontalButtonsView.addSubview(centerButton!)
            }
            else if buttons.count == 2
            {
                let buttonWidth = horizontalButtonsView.frame.width/2 - buttonPadding
                
                var leftRect = horizontalButtonsView.frame;
                leftRect.origin = CGPoint(x: 0, y:0)
                leftRect.size.width = buttonWidth;
                
                let leftButton = buttons.first
                leftButton!.frame = leftRect
                horizontalButtonsView.addSubview(leftButton!)
                
                var rightRect = horizontalButtonsView.frame;
                rightRect.size.width = buttonWidth;
                rightRect.origin = CGPoint(x: horizontalButtonsView.frame.width / 2 + buttonPadding * 2, y:0)
                
                let rightButton = buttons.last
                rightButton!.frame = rightRect
                horizontalButtonsView.addSubview(rightButton!)
            }
            else
            {
                // Implement for 3 and more buttons
                print("not yet exist login for > 2 buttons. Please use max 2 buttons")
                horizontalButtonsViewHeight.constant = 0;
                buttonViewBottom.constant = 0;
                horizontalButtonsView.isHidden = true
            }
        }
        else
        {
            //No buttons
            horizontalButtonsViewHeight.constant = 0;
            buttonViewBottom.constant = 0;
            horizontalButtonsView.isHidden = true
        }
        var heightForView : CGFloat = 0
        if self.nTextView.attributedText != nil
        {
            heightForView = self.heightForText(attrString: self.nTextView.attributedText)
            if heightForView + contentHeight < mainHeight - kVerticalMarginForMaxView
            {
                nTextView.isScrollEnabled = false
                heightForView = heightForView + contentHeight
            }
            else
            {
                nTextView.setContentOffset(CGPoint.zero, animated: false)
                heightForView = mainHeight - kVerticalMarginForMaxView
            }

        }
        var newFrame = self.frame;
        newFrame.size.height = heightForView;
        self.frame = newFrame
    }
    
    
    func heightForText(attrString : NSAttributedString) -> CGFloat
    {
        let rect = attrString.boundingRect(with: CGSize(width: mainWidth - kLeftAndRightPadding * 3, height: mainHeight), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        
        return rect.size.height
    }
}

