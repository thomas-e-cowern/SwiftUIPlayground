//
//  UIImage+Extensions.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/14/22.
//

import Foundation
import UIKit

extension UIImage {
    
    func resized(width: CGFloat) -> UIImage? {
        
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
        
    }
    
}
