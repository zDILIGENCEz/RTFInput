//
//  RTFInput.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import RxCocoa
import RxSwift
import UIKit

public typealias InputViolation = (message: String, callback: (() -> Void)?)

public class RTFInput: UIView {

    // MARK: - Public properties

    public var setting: RTFInputSettings?
    public let disposeBag = DisposeBag()
    public let rtfInputView = RTFInputView()

    public var floatingHint = UILabel()
    public var input = UITextField()
    public var warningLabel = UILabel()

    public var isEndEditing = false

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    // MARK: - Private methods

    private func setupView() {

        floatingHint = rtfInputView.floatingPlaceholderLabel
        input = rtfInputView.inputTextField
        warningLabel = rtfInputView.warningLabel

        rtfInputView.frame = bounds
        rtfInputView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(rtfInputView)
    }

    fileprivate func rx() {
        let vm = RTFInputViewModel(
            input: input.rx.text.orEmpty.asDriver(),
            dependency: (
                maxLength: setting?.maxLength,
                inputType: setting?.inputType
            )
        )

        vm.inputViolatedDrv
            .map({ status -> (status: ViolationStatus, violation: InputViolation?) in
                switch status {
                case .valid:
                    return (status, nil)
                case .inputTypeViolated:
                    return (status, self.setting?.inputTypeViolation)
                case .maxLengthViolated:
                    return (status, self.setting?.maxLengthViolation)
                }
            })
            .drive(rx.status)
            .disposed(by: disposeBag)

        vm.hintVisibleDrv
            .drive(rx.hintVisible)
            .disposed(by: disposeBag)
    }

}

extension RTFInput {

    public func setup(setting: RTFInputSettings) {

        self.setting = setting
        backgroundColor = setting.backgroundColor
        input.textColor = setting.textColor
        input.tintColor = setting.cursorColor
        input.placeholder = setting.placeholder
        input.isSecureTextEntry = setting.isSecure ?? false
        input.attributedPlaceholder = NSAttributedString(
            string: setting.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: setting.placeholderColor]
        )
        warningLabel.textColor = setting.accentColor

        input.rx.controlEvent([.editingDidBegin])
            .asObservable()
            .subscribe(onNext: { _ in
                self.isEndEditing = false
            })
            .disposed(by: disposeBag)
        input.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { _ in
                self.isEndEditing = true
            })
            .disposed(by: disposeBag)

        rx()
    }

    public func text() -> String? {
        return input.text
    }

    public func setEnabled(_ flag: Bool? = true) {
        guard let flag = flag else { return }
        input.isUserInteractionEnabled = flag
    }

    override public func resignFirstResponder() -> Bool {
        return input.resignFirstResponder()
    }
}

private extension Reactive where Base: RTFInput {

    var status: Binder<(status: RTFInput.ViolationStatus, violation: InputViolation?)> {

        return Binder(base, binding: { floatingInput, pair in
            guard let violation = pair.violation else {
                floatingInput.floatingHint.textColor = floatingInput.setting?.accentColor
                floatingInput.warningLabel.isHidden = true
                floatingInput.floatingHint.isHidden = false
                return
            }
            if self.base.isEndEditing {
                floatingInput.floatingHint.isHidden = true
                floatingInput.warningLabel.isHidden = false
                floatingInput.warningLabel.styledText = " \(violation.message) "
                floatingInput.warningLabel.textColor = floatingInput.setting?.warningColor
                if let callback = violation.callback {
                    callback()
                }
            }
        })
    }

    var hintVisible: Binder<RTFInput.HintVisibility> {

        return Binder(base, binding: { floatingInput, visibility in

            UIView.animate(withDuration: 0.3,  delay: 0.0, options: .curveEaseInOut, animations: {
                floatingInput.floatingHint.isHidden = (visibility != .visible)
                floatingInput.floatingHint.alpha = (visibility == .visible) ? 1.0 : 0.0
                floatingInput.floatingHint.styledText = (visibility == .visible) ?   floatingInput.setting?.placeholder : nil
            })
        })
    }

}
