//
//  BaseView.swift
//  RTFInput_Example
//
//  Created by Kusyumov Nikita on 13.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDefaultConstraints(in viewController: UIViewController) {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(viewController.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(viewController.bottomLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
