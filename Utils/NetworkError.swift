//
//  Error.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import Foundation


enum NetworkError: Error 
{
    case emptyResponse
    case invalidResponse
    case unknown(String)
    case decodeError
    
}
