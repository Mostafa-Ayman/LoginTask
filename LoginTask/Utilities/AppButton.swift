//
//  AppButton.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import UIKit

class AppButton: UIButton {
    @IBInspectable var originalColor: String = "019397"
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var imgTintColor: String = "FFFFFF"
    let originalBorderWidth: CGFloat = 0.6
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    override var titleLabel: UILabel? {
        let label = super.titleLabel
        label?.font = UIFont.avenir16Reg!
        return label
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBInspectable var isFilledBackground: Bool = false {
        didSet {
            self.updateView()
        }
    }

    override func prepareForInterfaceBuilder() {
        updateView()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.frame.width, height: 54.0)
    }

    override func draw(_: CGRect) {
        updateView()
    }

    func updateView() {
        DispatchQueue.main.async {
            self.clipsToBounds = true
            self.layer.cornerRadius = self.cornerRadius
            self.layer.borderColor = UIColor(hex: self.originalColor).cgColor
            self.layer.borderWidth = self.originalBorderWidth
            self.backgroundColor = self.isFilledBackground ? UIColor(hex: self.originalColor) : .clear
            self.tintColor = self.isFilledBackground ? .white : UIColor(hex: self.originalColor)
            self.imageView?.tintColor = UIColor(hex: self.imgTintColor)
        }
    }
}
