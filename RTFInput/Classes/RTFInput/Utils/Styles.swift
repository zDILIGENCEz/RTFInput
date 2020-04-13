//
//  Styles.swift
//  BonMot
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import UIKit
import BonMot

extension StringStyle {

    // MARK: - Sans

    public static func sansRegular14(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = UIFont.systemFont(ofSize: 14)
        style.font = font
        style.color = color
        return style
    }

    private static func lineHeightMultiple(spacing: CGFloat, font: UIFont) -> CGFloat {
        return spacing / font.lineHeight
    }
}
