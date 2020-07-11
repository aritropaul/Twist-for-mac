//
//  MenuViewController.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 12/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

enum Menu : Int {
    case all = 0
    case trending = 1
    case rated = 2
    case airing = 3
}


protocol MenuDelegate : class {
    func didSelectOption(index: Menu)
}

class MenuViewController: UITableViewController {
    
    var menu = ["All", "Trending", "Top Rated", "Top Airing"]
    var normalIcons = ["square.stack", "flame", "star", "tv"]
    var highlightedIcons = ["square.stack.fill", "flame.fill", "star.fill", "tv.fill"]

    weak var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView(self.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.titleLabel.text = menu[indexPath.row]
        cell.iconView.image = UIImage(systemName: normalIcons[indexPath.row])
        cell.iconView.highlightedImage = UIImage(systemName: highlightedIcons[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        cell.backView.backgroundColor = UIColor(red: 0.90, green: 0.20, blue: 0.20, alpha: 1.00)
        cell.iconView.tintColor = .white
        cell.titleLabel.textColor = .white
        cell.iconView.isHighlighted = true
        delegate?.didSelectOption(index: Menu(rawValue: indexPath.row) ?? .all)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        cell.backView.backgroundColor = .clear
        cell.iconView.tintColor = .label
        cell.titleLabel.textColor = .label
        cell.iconView.isHighlighted = false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

