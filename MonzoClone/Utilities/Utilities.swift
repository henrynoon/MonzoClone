//
//  Utilities.swift
//  MonzoClone
//
//  Created by Henry Noon on 07/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        //top, leading, bottom, trailing constraints
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        //constraining size
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        
        image = nil

        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, responses, error) in
            
            if error != nil  {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data!)

                imageCache.setObject(imageToCache!, forKey: urlString as NSString)

                self.image = imageToCache
            }

        }.resume()
    }
}


extension UILabel {
    
    func formatCurrency(amount: Double, currency: String) {
       
        let amountInHundredths = amount/100
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = currency
        
        if amountInHundredths < 0 {
            self.text = numberFormatter.string(from: -amountInHundredths as NSNumber)
        } else {
            self.text = numberFormatter.string(from: amountInHundredths as NSNumber)
        }
    }
    
    func formatDateWithoutTime(date: String) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let dateRepresentation = dateFormatter.date(from: date) {
            
            let displayFormatter = DateFormatter()
            
            /* if year == current year { exclude year from dateFormat } else { include in dateFormat }
             
             
             
             */
            
            
            displayFormatter.dateFormat = "EEEE, d MMM"
            displayFormatter.locale = Locale(identifier: "en_GB_POSIX")
            
            self.text = displayFormatter.string(from: dateRepresentation)
        }
    }
}


extension StringProtocol {
    
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(_ range: Range<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}



