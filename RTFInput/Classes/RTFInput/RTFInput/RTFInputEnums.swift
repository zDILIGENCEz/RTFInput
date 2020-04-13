//
//  RTFInputEnums.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import UIKit

public extension RTFInput {

    enum InputType {
        case number
        case phone
        case password
        case email
        case index
        case cardNumber
        case cardValidity
        case CVV
        case regex(pattern: String)

        internal var pattern: String? {
            switch self {
            case .number:
                return "[0-9]"
            case .phone:
                return "^(\\+7) \\([0-9]{3}\\) [0-9]{3}\\-[0-9]{2}-[0-9]{2}$"
            case .password:
                return "[A-Za-z0-9]{6,}"
            case .email:
                return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            case .index:
                return "[0-9]{3} [0-9]{3}"
            case .cardNumber:
                return "[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
            case .cardValidity:
                return "[0-1]{1}[0-9]{1}/[0-9]{2}"
            case .CVV:
                return "[0-9]{3}"
            case .regex(let p):
                return p
            }
        }
    }

    enum Theme {
        case standard
        case dark
        case light

        var background: UIColor {
            switch self {
            case .standard:
                return .white
            case .dark:
                return UIColor(hex: 0x263238)
            case .light:
                return UIColor(hex: 0xF0E8E1)
            }
        }

        var text: UIColor {
            switch self {
            case .standard:
                return UIColor(hex: 0x212121)
            case .dark:
                return UIColor(hex: 0xBDBDBD)
            case .light:
                return UIColor(hex: 0x424242)
            }
        }

        var placeholder: UIColor {
            switch self {
            case .standard:
                return UIColor(hex: 0xC7C7CD)
            case .dark:
                return UIColor(hex: 0x616161)
            case .light:
                return UIColor(hex: 0xC0B9B4)
            }
        }

        var cursor: UIColor {
            switch self {
            case .standard:
                return UIColor(hex: 0x757575)
            case .dark:
                return UIColor(hex: 0x2C434E)
            case .light:
                return UIColor(hex: 0x757575)
            }
        }

        var accent: UIColor {
            switch self {
            case .standard:
                return UIColor(hex: 0x01579B)
            case .dark:
                return UIColor(hex: 0x9E8C43)
            case .light:
                return UIColor(hex: 0x6B7B82)
            }
        }

        var warning: UIColor {
            switch self {
            case .standard:
                return UIColor(hex: 0xB71C1C)
            case .dark:
                return UIColor(hex: 0xB23648)
            case .light:
                return UIColor(hex: 0xB66E65)
            }
        }
    }

}

public extension RTFInput {

    enum ViolationStatus {
        case valid
        case maxLengthViolated
        case inputTypeViolated
    }

    enum HintVisibility {
        case visible
        case hidden
    }

}

private extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}
