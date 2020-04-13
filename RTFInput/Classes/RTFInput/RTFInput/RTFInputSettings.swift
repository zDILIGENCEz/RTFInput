//
//  RTFInputSettings.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import UIKit

extension RTFInputSettings {

    public class Builder {

        fileprivate var _theme: RTFInput.Theme = .standard
        fileprivate var _backgroundColor: UIColor = .white
        fileprivate var _textColor: UIColor = .gray
        fileprivate var _placeholderColor: UIColor = .gray
        fileprivate var _cursorColor: UIColor = .scDeepBlush
        fileprivate var _accentColor: UIColor = .black
        fileprivate var _warningColor: UIColor = .red

        fileprivate var _placeholder: String?
        fileprivate var _secure: Bool = false

        fileprivate var _maxLength: Int?
        fileprivate var _maxLengthViolation: InputViolation?
        fileprivate var _inputType: RTFInput.InputType?
        fileprivate var _inputTypeViolation: InputViolation?

        public static func instance() -> Builder {
            return Builder()
        }

        public func theme(_ theme: RTFInput.Theme) -> Builder {
            _theme = theme
            return self
        }

        public func backgroundColor(_ color: UIColor) -> Builder {
            _backgroundColor = color
            return self
        }

        public func textColor(_ color: UIColor) -> Builder {
            _textColor = color
            return self
        }

        public func placeholderColor(_ color: UIColor) -> Builder {
            _placeholderColor = color
            return self
        }

        public func cursorColor(_ color: UIColor) -> Builder {
            _cursorColor = color
            return self
        }

        public func accentColor(_ color: UIColor) -> Builder {
            _accentColor = color
            return self
        }

        public func warningColor(_ color: UIColor) -> Builder {
            _warningColor = color
            return self
        }

        public func placeholer(_ placeholder: String) -> Builder {
            _placeholder = " " + placeholder + " "
            return self
        }

        public func secure(_ isSecure: Bool) -> Builder {
            _secure = isSecure
            return self
        }

        public func maxLength(_ length: Int, onViolated violation: InputViolation) -> Builder {
            _maxLength = length
            _maxLengthViolation = violation
            return self
        }

        public func inputType(_ type: RTFInput.InputType, onViolated violation: InputViolation) -> Builder {
            _inputType = type
            _inputTypeViolation = violation
            return self
        }

        public func build() -> RTFInputSettings {
            return RTFInputSettings(builder: self)
        }
    }

}

public class RTFInputSettings {

    public let backgroundColor: UIColor
    public let textColor: UIColor
    public let placeholderColor: UIColor
    public let cursorColor: UIColor
    public let accentColor: UIColor
    public let warningColor: UIColor

    public let placeholder: String?
    public let isSecure: Bool?

    public let maxLength: Int?
    public let maxLengthViolation: InputViolation?
    public let inputType: RTFInput.InputType?
    public let inputTypeViolation: InputViolation?

    public init(builder: Builder) {

        backgroundColor = builder._backgroundColor
        textColor = builder._textColor
        placeholderColor = builder._placeholderColor
        cursorColor = builder._cursorColor
        accentColor = builder._accentColor
        warningColor = builder._warningColor

        placeholder = builder._placeholder
        isSecure = builder._secure

        maxLength = builder._maxLength
        maxLengthViolation = builder._maxLengthViolation
        inputType = builder._inputType
        inputTypeViolation = builder._inputTypeViolation
    }

}
