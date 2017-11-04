//
//  DropDownView.swift
//  YTDropDownButton
//
//  Created by Yiğit Can Türe on 4.11.2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit

protocol DropDownProtocol {
    func dropDownPressed(string : String)
}

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    var dropViewBackground : UIColor?
    var dropViewTextColor : UIColor?
    var dropViewFont : UIFont?
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : DropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initTableView()
    }
    
    override func layoutSubviews() {
        tableView.backgroundColor = dropViewBackground
        self.backgroundColor = dropViewBackground
    }
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.textLabel?.textColor = dropViewTextColor ?? UIColor.black
        cell.backgroundColor = dropViewBackground ?? UIColor.white
        cell.textLabel?.font = dropViewFont ?? UIFont.systemFont(ofSize: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
