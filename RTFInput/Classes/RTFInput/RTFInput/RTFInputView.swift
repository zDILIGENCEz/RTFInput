//
//  RTFInputView.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import UIKit
import BonMot
import SnapKit

public class RTFInputView: UIView {

    // MARK: - Internal properties

    struct Appearance: Grid {
        let dividerViewTopOffset: CGFloat = 1
        let floatingPlaceholderLabelBottomInset: CGFloat = 2
        let viewCornerRadius: CGFloat = 3
        let inputTextFieldBottomInset: CGFloat = 26
        let inputTextFieldViewHeight: CGFloat = 55
        let inputTextFieldViewCenterYOffset: CGFloat = 5

        let inputTextFieldHeight: CGFloat = 30
        let floatingPlaceholderLabelHeight: CGFloat = 10
        let warningLabelHeight: CGFloat = 20
    }
    let appearance = Appearance()

    // MARK: - UI elements

    lazy var floatingPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .sansRegular14(.gray)
        label.backgroundColor = .white
        return label
    }()

    lazy var inputTextFieldView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.scAthens.cgColor
        view.layer.borderWidth = appearance.dividerViewTopOffset
        view.layer.cornerRadius = appearance.viewCornerRadius
        return view
    }()

    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.bonMotStyle = .sansRegular14(.gray)
        return textField
    }()

    lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .sansRegular14(.red)
        label.backgroundColor = .white
        return label
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
        addSubview(inputTextFieldView)
        addSubview(floatingPlaceholderLabel)
        addSubview(warningLabel)

        inputTextFieldView.addSubview(inputTextField)
    }

    private func makeConstraints() {
        inputTextFieldView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(appearance.inputTextFieldViewHeight)
        }

        inputTextField.snp.makeConstraints { make in
            make.center.height.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .offset(appearance.xsSpace)
        }

        floatingPlaceholderLabel.snp.makeConstraints { make in
            make.centerY.equalTo(inputTextFieldView.snp.top)
            make.leading.equalToSuperview()
                .offset(appearance.xsSpace)
            make.trailing.lessThanOrEqualToSuperview()
                .inset(appearance.xsSpace)

        }

        warningLabel.snp.makeConstraints { make in
            make.centerY.equalTo(inputTextFieldView.snp.top)
            make.leading.equalToSuperview()
                .offset(appearance.xsSpace)
            make.trailing.lessThanOrEqualToSuperview()
                .inset(appearance.xsSpace)
        }
    }

}
