//
//  Keyboard.swift
//  HW_4.1
//
//  Created by Konstantin Losev on 10.09.2021.
//

import UIKit

// сокрытие клавиатуры тапом поэкрану

extension UIView {
    func makeDissmissKeyboardTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.endEditing))
        self.addGestureRecognizer(tap)
    }
    
}
