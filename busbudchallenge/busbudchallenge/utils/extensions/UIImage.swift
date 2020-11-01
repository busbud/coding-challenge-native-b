//
//  UIImage.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

extension UIImage {
    func blur(_ radius: Double) -> UIImage? {
        guard let img = CIImage(image: self) else {
            return nil
        }
        return UIImage(ciImage: img.applyingGaussianBlur(sigma: radius))
    }
}
