//
//  InjectedValues.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import Foundation

struct InjectedValues {
    private static var current = InjectedValues()

    static subscript<K>(key: K.Type) -> K.Value where K: InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

// MARK: - List of injected values

private struct DeviceServiceKey: InjectionKey {
    static var currentValue: DeviceService = MockDeviceService()
}

extension InjectedValues {
    var deviceService: DeviceService {
        get { Self[DeviceServiceKey.self] }
        set { Self[DeviceServiceKey.self] = newValue }
    }
}
