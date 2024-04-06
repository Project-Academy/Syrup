//
//  Ext-UIViewController.swift
//  Syrup
//
//  Created by Sarfraz Basha on 27/3/2024.
//

import UIKit

public extension UIViewController {
    func present(_ vc: UIViewController, isAnimated: Bool = true, completion: (() -> Void)? = nil) {
        vc.traitOverrides = self.traitOverrides
        self.present(vc, animated: isAnimated, completion: completion)
    }
}
