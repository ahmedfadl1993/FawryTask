//
//  Bindables.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

public class Bindable<BindType> {
    
    public typealias Listener = ((BindType) -> Void)
    
    private var listeners: [(identifier: UUID, listener: Listener)] = []
    
    public var value: BindType {
        didSet {
            notifyListeners(value)
        }
    }
    
    public init(_ v: BindType) {
        value = v
    }
    
    public func bind(_ listener: @escaping Listener) -> BindDisposable {
        let listenerId = UUID()
        let disposable = BindDisposable(onDispose: { [weak self] in
            self?.removeListener(with: listenerId)
        })
        
        self.listeners.append((identifier: listenerId, listener: listener))
        
        return disposable
    }
    
    public func bindAndFire(_ listener: @escaping Listener) -> BindDisposable {
        let disposable = self.bind(listener)
        listener(value)
        return disposable
    }
    
    private func removeListener(with id: UUID) {
        self.listeners.removeAll(where: { $0.identifier == id })
    }
    
    private func notifyListeners(_ value: BindType) {
        self.listeners.forEach({ $0.listener(value) })
    }
}

public class BindDisposable {
    
    private let onDispose: (() -> Void)
    
    init(onDispose: @escaping () -> Void) {
        self.onDispose = onDispose
    }
    
    public func dispose() {
        onDispose()
    }
    
    deinit {
        dispose()
    }
}

public struct DisposableBag {
    
    private var disposables: [BindDisposable] = []
    
    public init() {
        
    }
    public mutating func add(_ disposable: BindDisposable?) {
        
        guard let disposable = disposable else {
            return
        }
        disposables.append(disposable)
    }
}
