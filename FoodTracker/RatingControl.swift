//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Andrea Perazzi on 16/04/16.
//  Copyright © 2016 Andrea Perazzi. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    let spacing = 5
    let stars = 5
    var rating = 0 {
        // Property observer, is called immediately after the property’s value is set
        didSet {
            // It will trigger a layout update every time the rating changes
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            ratingButtons += [button]
            addSubview(button)
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
        }
    }
    
    override func layoutSubviews() {
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * stars) + (spacing * (stars - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    
    // MARK: Button Action
    func ratingButtonTapped(button:UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index on a button is less than the rating, that button sould be selected
            button.selected = index < rating
        }
    }
    
}
