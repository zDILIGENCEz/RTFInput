//
//  MainView.swift
//  RTFInput_Example
//
//  Created by Kusyumov Nikita on 13.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import RTFInput

class MainView: UIView {
    
    
    // MARK: - UI elements
    
    lazy var enterTextInputView: RTFInput = {
        let textInputView = RTFInput()
        let setting = RTFInputSettings.Builder.instance()
            .placeholer("Placeholder")
            .build()
        textInputView.setup(setting: setting)
        return textInputView
    }()

    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(enterTextInputView)
    }
    
    private func makeConstraints() {
        enterTextInputView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(16)
            make.height.equalTo(55)
        }
    }
    
}
