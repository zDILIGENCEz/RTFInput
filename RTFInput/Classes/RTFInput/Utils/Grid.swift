//
//  Grid.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import UIKit

/// Протокол определяющий сетку по которой верстаются визуальный компоненты
/// Опередление кастомных размеров в Appearance допускается только в исключительных случаях
///
/// Пример:
/// extension MyModuleView {
///     struct Appearance: Grid { }
/// }
///
/// class MyModuleView: UIView {
///     let appearance = Appearance()
///     lazy var subview = UIView()
///
///     private func makeConstraints() {
///         subview.snp.makeConstraints { (make) in
///             make.top.left.right.equalToSuperview().inset(appearance.xxlInsets)
///             make.height.equalTo(appearance.xxlSize)
///             make.top.equalTo(previousSubview.snp.bottom).inset(appearance.xxsSpace)
///         }
///     }
/// }
public protocol Grid {
    /// Размер минимального элемента сетки
    static var gridUnitSize: CGSize { get }
}

// MARK: - Cетки для верстки по умолчанию

public extension Grid {
    /// Значение минимального размера сетки по умолчанию
    static var gridUnitSize: CGSize { return CGSize(4) }

    // MARK: Grid multipliers

    /// = 0
    static var zero: CGFloat { return 0 }
    /// = 1
    static var xxxs: CGFloat { return 1 }
    /// = 2
    static var xxs: CGFloat { return 2 }
    /// = 3
    static var xs: CGFloat { return 3 }
    /// = 4
    static var s: CGFloat { return 4 }
    /// = 6
    static var m: CGFloat { return 6 }
    /// = 8
    static var l: CGFloat { return 8 }
    /// = 9
    static var xl: CGFloat { return 9 }
    /// = 12
    static var xxl: CGFloat { return 12 }
    /// = 18
    static var xxxl: CGFloat { return 18 }

    var zero: CGFloat { return 0 }
    /// = 4,  если gridUnitSize не переопределён
    var xxxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxs) }
    /// = 8,  если gridUnitSize не переопределён
    var xxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxs) }
    /// = 12,  если gridUnitSize не переопределён
    var xsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xs) }
    /// = 16,  если gridUnitSize не переопределён
    var sSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.s) }
    /// = 24,  если gridUnitSize не переопределён
    var mSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.m) }
    /// = 32,  если gridUnitSize не переопределён
    var lSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.l) }
    /// = 36,  если gridUnitSize не переопределён
    var xlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xl) }
    /// = 48,  если gridUnitSize не переопределён
    var xxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxl) }
    /// = 72,  если gridUnitSize не переопределён
    var xxxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxl) }

}

public extension CGSize {
    /// Инициализирует струтуру с идентичными размерами по высоте и ширине, равными входящему параметру
    ///
    /// - Parameter size: размер с которым нужно инициализировать структуру
    init(_ size: CGFloat) {
        self.init(width: size, height: size)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура CGSize
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}
