//
//  YTDropDownButton.swift
//  YTDropDownButton
//
//  Created by Yiğit Can Türe on 3.11.2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit

public class YTDropDownButton: UIButton,DropDownProtocol {
    
    @IBInspectable public var dropViewBackground : UIColor?
    @IBInspectable public var dropViewTextColor : UIColor?
    @IBInspectable public var dropViewFont : UIFont?
    @IBInspectable public var maximumHeightForDropView : CGFloat = 150
    fileprivate var data : [String]!
    fileprivate var isOpen = false
    fileprivate var dropView : DropDownView!
    var height = NSLayoutConstraint()
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    public func setData(arr : [String]) {
        self.data = arr
        self.dropView.dropDownOptions = arr
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initDropView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initDropView()
    }
    
    func initDropView() {
        dropView = DropDownView(frame: .zero)
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override public func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: self)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        dropView.dropViewFont = dropViewFont
        dropView.dropViewTextColor = dropViewTextColor
        dropView.dropViewBackground = dropViewBackground
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if data == nil || data.count == 0 {
            self.shakeSelf()
            return
        }
        if isOpen == false {
            showDropDown()
        } else {
            dismissDropDown()
        }
    }
    
    func shakeSelf() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func showDropDown() {
        isOpen = true
        self.dropView.tableView.reloadData()
        self.superview?.bringSubview(toFront: dropView)
        NSLayoutConstraint.deactivate([self.height])
        if self.dropView.tableView.contentSize.height > maximumHeightForDropView {
            self.height.constant = maximumHeightForDropView
        } else {
            self.height.constant = self.dropView.tableView.contentSize.height
        }
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.layoutIfNeeded()
            self.dropView.center.y += self.dropView.frame.height / 2
        }, completion: nil)
    }
    
    func dismissDropDown() {
        isOpen = false
        self.superview?.bringSubview(toFront: self)
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
}



