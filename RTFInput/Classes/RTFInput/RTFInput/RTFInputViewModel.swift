//
//  RTFInputViewModel.swift
//  RTFInput
//
//  Created by Kusyumov Nikita on 13.04.2020.
//

import RxCocoa
import RxSwift

internal class RTFInputViewModel {

    internal let inputViolatedDrv: Driver<RTFInput.ViolationStatus>
    internal let hintVisibleDrv: Driver<RTFInput.HintVisibility>

    internal init(input: Driver<String>, dependency: (maxLength: Int?, inputType: RTFInput.InputType?)) {

        inputViolatedDrv = input
            .map({ content -> RTFInput.ViolationStatus in

                guard content.count > 0 else {
                    return .valid
                }
                guard let rp = dependency.inputType?.pattern, !RTFInputViewModel.regex(pattern: rp, input: content) else {
                    return .inputTypeViolated
                }
                guard let ml = dependency.maxLength, content.count < ml else {
                    return .maxLengthViolated
                }
                return .valid
            })

        hintVisibleDrv = input
            .map({ content -> RTFInput.HintVisibility in
                return (content.count > 0) ? .visible : .hidden
            })
            .distinctUntilChanged()
    }
}

private extension RTFInputViewModel {

    static func regex(pattern: String, input: String) -> Bool {
        do {
            let regexNumbersOnly = try NSRegularExpression(pattern: pattern, options: [])
            return regexNumbersOnly.firstMatch(
                in: input,
                options: [],
                range: NSRange(location: 0, length: input.count)
            ) == nil

        } catch let error as NSError {
            print(error.description)
        }
        return true
    }

}
