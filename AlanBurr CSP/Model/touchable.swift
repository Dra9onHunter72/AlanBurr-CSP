//
//  touchable.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import Foundation
public protocol touchable
{
    var touchState : Bool {get set}
    func touch() -> Void
    func isTouching() -> Bool
    

    
}
