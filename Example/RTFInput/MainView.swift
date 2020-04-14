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
    
    lazy var firstTextInputView: RTFInput = {
        let textInputView = RTFInput()
        let setting = RTFInputSettings.Builder.instance()
            .placeholer("Placeholder")
            .theme(.standard)
            .build()
        textInputView.setup(setting: setting)
        return textInputView
    }()
    
    lazy var secondTextInputView: RTFInput = {
        let textInputView = RTFInput()
        let setting = RTFInputSettings.Builder.instance()
            .placeholer("Placeholder")
            .theme(.light)
            .build()
        textInputView.setup(setting: setting)
        return textInputView
    }()
    
    lazy var thirdTextInputView: RTFInput = {
        let textInputView = RTFInput()
        let setting = RTFInputSettings.Builder.instance()
            .placeholer("Placeholder")
            .theme(.dark)
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
        addSubview(firstTextInputView)
        addSubview(secondTextInputView)
        addSubview(thirdTextInputView)
    }
    
    private func makeConstraints() {
        firstTextInputView.snp.makeConstraints { make in
            make.bottom.equalTo(secondTextInputView.snp.top)
                .offset(-24)
            make.leading.trailing.equalToSuperview()
                .inset(16)
            make.height.equalTo(55)
        }
        
        secondTextInputView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(16)
            make.height.equalTo(55)
        }
        
        thirdTextInputView.snp.makeConstraints { make in
            make.top.equalTo(secondTextInputView.snp.bottom)
                .offset(24)
            make.leading.trailing.equalToSuperview()
                .inset(16)
            make.height.equalTo(55)
        }
    }
    
}
