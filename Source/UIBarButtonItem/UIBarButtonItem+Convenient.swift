//
//  UIBarButtonItem+Convenient.swift
//  GGUI
//
//  Created by John on 2018/11/22.
//  Copyright © 2018 GGUI. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    convenience init(image: UIImage,
                     selectImage: UIImage? = nil,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     actionBlock: VoidBlock? = nil) {
        self.init()
        let barButton = UIButton()
        barButton.setImage(image, for: .normal)
        if let selectImage = selectImage {
            barButton.setImage(selectImage, for: .selected)
        }
        barButton.onTap { (_) in
            actionBlock?()
        }
        barButton.contentEdgeInsets = contentEdgeInsets
        barButton.sizeToFit()
        customView = barButton
    }

    convenience init(title: String,
                     color: UIColor,
                     font: UIFont,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     actionBlock: VoidBlock? = nil) {
        self.init()
        let barButton = UIButton()
        barButton.titleLabel?.font = font
        barButton.setTitleColor(color, for: .normal)
        barButton.setTitle(title, for: .normal)
        barButton.onTap { (_) in
            actionBlock?()
        }
        barButton.contentEdgeInsets = contentEdgeInsets
        barButton.sizeToFit()
        self.customView = barButton
    }

    convenience init(title: String,
                     image: UIImage,
                     direction: TitleImageDirection = .left,
                     space: CGFloat,
                     color: UIColor,
                     font: UIFont,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     actionBlock: VoidBlock? = nil) {
        self.init()
        let barButton = LayoutButton()
        barButton.titleLabel?.font = font
        barButton.setTitleColor(color, for: .normal)
        barButton.setTitle(title, for: .normal)
        barButton.setImage(image, for: .normal)
        barButton.imageDirection = direction
        barButton.imageTitleSpace = space
        barButton.onTap { (_) in
            actionBlock?()
        }
        barButton.contentEdgeInsets = contentEdgeInsets
        barButton.sizeToFit()
        self.customView = barButton
    }
}
