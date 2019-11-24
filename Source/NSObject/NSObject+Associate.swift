//
//  NSObject+Associate.swift
//  GGUI
//
//  Created by John on 2019/5/22.
//  Copyright © 2018 GGUI. All rights reserved.
//
import Foundation

public extension NSObject {
    /// Sets an associated value for a given object using a weak reference to the associated object.
    /// **Note**: the `key` underlying type must be String.
    func associate(assignObject object: Any?, forKey key: UnsafeRawPointer) {
        let strKey: String = convertUnsafePointerToSwiftType(key)
        willChangeValue(forKey: strKey)
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_ASSIGN)
        didChangeValue(forKey: strKey)
    }

    /// Sets an associated value for a given object using a strong reference to the associated object.
    /// **Note**: the `key` underlying type must be String.
    func associate(retainObject object: Any?, forKey key: UnsafeRawPointer) {
        let strKey: String = convertUnsafePointerToSwiftType(key)
        willChangeValue(forKey: strKey)
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        didChangeValue(forKey: strKey)
    }

    /// Sets an associated value for a given object using a copied reference to the associated object.
    /// **Note**: the `key` underlying type must be String.
    func associate(copyObject object: Any?, forKey key: UnsafeRawPointer) {
        let strKey: String = convertUnsafePointerToSwiftType(key)
        willChangeValue(forKey: strKey)
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        didChangeValue(forKey: strKey)
    }

    /// Returns the value associated with a given object for a given key.
    /// **Note**: the `key` underlying type must be String.
    func associatedObject(forKey key: UnsafeRawPointer) -> Any? {
        return objc_getAssociatedObject(self, key)
    }
}
