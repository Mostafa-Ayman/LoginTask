//
//  AppTextField.swift
//  LoginTask
//
//  Created by Mostafa Ayman on 21/05/2021.
//

import UIKit

class AppTextfield: UITextField {
    let originalBorderColor: String = "CBCFD4"
    let originalBorderWidth: CGFloat = 0.6
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    let activeBorderColor: String = "019397"
    let activeBackgroundColor = UIColor(hex: "EAFFFC").withAlphaComponent(0.5)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if fontSize == 16.0 {
            font = UIFont.avenir16Reg
        } else {
            font = UIFont(name: "Avenir-Regular", size: fontSize)
        }
        tintColor = UIColor(hex: activeBorderColor)
        textColor = .black

        addTarget(self, action: #selector(startEditing), for: UIControl.Event.editingDidBegin)
        addTarget(self, action: #selector(endTextfieldEditing), for: UIControl.Event.editingDidEnd)
    }

    // Provides right padding for images
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var imageRect = super.rightViewRect(forBounds: bounds)
        imageRect.origin.x += rightPadding
        return imageRect
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var imageRect = super.leftViewRect(forBounds: bounds)
        imageRect.origin.x += rightPadding
        return imageRect
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var errorImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var rightPadding: CGFloat = 8
    @IBInspectable var fontSize: CGFloat = 16.0

    @IBInspectable var havingError: Bool = false {
        didSet {
            layer.borderColor = havingError ? UIColor.red.cgColor : UIColor(hex: originalBorderColor).cgColor
            if rightImage == nil { // If the textfield doesn't have right image and also having an error, so add an error image
                rightViewMode = UITextField.ViewMode.always
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.contentMode = .scaleAspectFit
                imageView.image = havingError ? errorImage : rightImage

                imageView.tintColor = havingError ? .red : .appGreenColor
                rightView = imageView
            } else {
                updateView()
            }
        }
    }

    var isActive: Bool = false {
        didSet {
            self.layer.borderColor = self.isActive ? UIColor(hex: self.activeBorderColor).cgColor : UIColor(hex: self.originalBorderColor).cgColor
            self.backgroundColor = self.isActive ? self.activeBackgroundColor : .white
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
        layer.cornerRadius = 5
        if !isActive {
            layer.borderColor = havingError ? UIColor.red.cgColor : UIColor(hex: originalBorderColor).cgColor
        }
        layer.borderWidth = originalBorderWidth
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = havingError ? errorImage : image
            imageView.clipsToBounds = true

            imageView.tintColor = havingError ? .red : .appGreenColor
            rightView = imageView
        }
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = .lightGray
            imageView.clipsToBounds = true

            leftView = imageView
        }
    }

    @objc func startEditing() {
        isActive = true
    }

    @objc func endTextfieldEditing() {
        isActive = false
    }
}
