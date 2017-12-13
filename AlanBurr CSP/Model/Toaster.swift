//
//  Toaster.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import Foundation
public class Toaster : touchable
{
    public var touchState : Bool
    public init()
    {
        self.touchState = false
    }

    //MARK:- Touchable methods
    public func touch() -> Void
    {
        print("I am touchable")
        touchState = true
    }

    public func isTouching() -> Bool
    {
        if(touchState)
        {
            print("Touched")
        }
        else
        {
            print("Not Touched")
        }
        return touchState
    }
}
