//
//  ViewController.swift
//  YTDropDownButtonDemo
//
//  Created by Yiğit Can Türe on 3.11.2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit
import YTDropDownButton

class ViewController: UIViewController {
    @IBOutlet weak var btnDropDown: YTDropDownButton!
    private var dropButtonCode : YTDropDownButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnDropDown.layer.cornerRadius = 5
        btnDropDown.setData(arr : ["This","came","from","storyboard"])
        
        dropButtonCode = YTDropDownButton(frame: .zero)
        dropButtonCode.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        dropButtonCode.titleLabel?.textColor = UIColor.white
        dropButtonCode.setTitle("Button from code", for: .normal)
        dropButtonCode.dropViewTextColor = UIColor.white
        dropButtonCode.dropViewBackground = #colorLiteral(red: 0.168484956, green: 0.4678698778, blue: 0.7191821933, alpha: 1)
        dropButtonCode.dropViewFont = UIFont(name: "AvenirNext-Regular", size: 15)
        dropButtonCode.maximumHeightForDropView = 100
        //dropButtonCode.setData(arr: ["we","created","this","from","code"])
        
        dropButtonCode.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dropButtonCode)
        
        dropButtonCode.widthAnchor.constraint(equalToConstant: 200).isActive  = true
        dropButtonCode.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dropButtonCode.topAnchor.constraint(equalTo: self.view.topAnchor, constant:30).isActive = true
        dropButtonCode.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeDatas), userInfo: nil, repeats: false)
        
    }
    
    @objc func changeDatas(){
        let arr : [String] = ["1","2","3","4"]
        dropButtonCode.setData(arr: arr)
    }

}

