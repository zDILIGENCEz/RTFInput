//
//  BaseViewController.swift
//  RTFInput_Example
//
//  Created by Kusyumov Nikita on 13.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Internal properties
    
    private let baseView = BaseView()

    // MARK: - UI elements
    
    var customView: UIView {
        return UIView()
    }
    
    var prefersNavigationBarHidden: Bool {
        return false
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(prefersNavigationBarHidden, animated: animated)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(for: super.navigationItem)
    }
    
    override func loadView() {
        view = baseView
        view.backgroundColor = .white
        baseView.makeDefaultConstraints(in: self)
        baseView.contentView.addSubview(customView)
        customView.backgroundColor = .white
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc
    func dismissScreen() {
        dismiss(animated: true)
    }
    
    @objc
    func popViewControllerWithAnimate() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BaseViewController {
    
    func configureNavigationItem(for navigationItem: UINavigationItem) {
        setupStyle()
    }
    
    func setupStyle() {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.barTintColor = .white
        //navigationController?.navigationBar.shadowImage = UIImage.image(with: .white, size: CGSize(width: 1, height: 1))
        //navigationController?.navigationBar.tintColor = .orBurntSienna
    }
    
    func setupBlackNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
    }
    
}
