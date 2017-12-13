//
//  AlgorithmsViewController.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/8/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class AlgorithmsViewController
{
    // Mark: Data mambers
    @IBOutlet weak var algorithmText: UILabel!


    private func setupAlgorithm() -> Void
    {
        var algorithmSteps : [String] = []
    
        // TODO: Define algorithm and all steps
        let algorithm :String = "These are the instructions to create a project in Swift using Xcode and Github \n"
        let stepOne :String = "Create a github repository for the project"
        let stepTwo :String = "Create and declare the button"
        let stepThree :String = "Code the button so it will play music and change colors"
        let stepFour : String = "Create and declare a slider"
        let stepFive :String = "Code slider so it will display how long the song is"
        let stepSix :String = "Make a commit on github"
        let stepSeven :String = "Make a private function for the button"
        let stepEight :String = "Make an if structure to make a play/pause button"
        let stepNine :String = "Test the project and make sure it will work"
        let stepTen :String = " Make a commit on github"
        
        // TODO: Finish adding all steps to the algorithms
        algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive, stepSix, stepSeven, stepEight, stepNine, stepTen]
        
        let attributesDictionary = [NSAttributedStringKey.font : algorithmText.font]
        let fullAttributedString = NSMutableAttributedString(string: algorithm, attributes: attributesDictionary)
        
        for step in algorithmSteps
        {
            let bullet :String = ":)"
            let formattedStep :String = "\n\(bullet) \(step)"
            let attributedStringStep : NSMutableAttributedString = NSMutableAttributedString(string: formattedStep)
            let paragraphStyle = createParagraphStyle()
            
            attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0,attributedStringStep.length))
            
            fullAttributedString.append(attributedStringStep)
        }
        
        algorithmText.attributedText = fullAttributedString
    }
    
    private func createParagraphStyle() -> NSParagraphStyle
    {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 20
        paragraphStyle.headIndent = 35
        
        return paragraphStyle
    }
}
