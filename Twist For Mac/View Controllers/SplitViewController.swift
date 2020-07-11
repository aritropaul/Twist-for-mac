//
//  SplitViewController.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 12/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.primaryBackgroundStyle = .sidebar
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        if let menuVC = self.children[0] as? MenuViewController {
            menuVC.delegate = self
        }
    }
}

extension SplitViewController : MenuDelegate {
    func didSelectOption(index: Menu) {
        if let navVC = self.children[1] as? UINavigationController {
            if let animeVC = navVC.topViewController as? AnimeViewController {
                animeVC.page = 1
                animeVC.loadAnime(option: index)
            }
        }
    }
}
