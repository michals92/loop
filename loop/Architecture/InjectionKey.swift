//
//  InjectionKey.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import Foundation

public protocol InjectionKey {
    associatedtype Value

    static var currentValue: Self.Value { get set }
}
