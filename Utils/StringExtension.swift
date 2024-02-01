//
//  String.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import Foundation
import UIKit


extension String 
{
    func strikeThrough() -> NSAttributedString 
    {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
}
