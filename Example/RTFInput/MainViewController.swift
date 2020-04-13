//
//  MainViewController.swift
//  RTFInput_Example
//
//  Created by Kusyumov Nikita on 13.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let mainView = MainView()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return mainView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action handlers
    
    // MARK: - Private methods

    
}
