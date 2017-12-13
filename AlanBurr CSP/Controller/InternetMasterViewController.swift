//
//  InternetViewController.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/8/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITableViewController
{
    private (set) lazy var internetTopics : [String] =
    {
        return [
            "Definitions",
            "CSP",
            "CTEC",
            "Canyons",
            "Twitter",
            "Swift Guide",
        ]
    }()
    
    private lazy var addresses : [String] = []
    
    private var detailViewController : InternetDetailViewController?
    
    private func setup() -> Void
    {
        //TODO: Replace with your correct links
        addresses = [
            "https://www.google.com",
            "https://apstudent.collegeboard.org/apcourse/ap-computer-science-principles",
            "https://ctec.canyonsdistrict.org/",
            "https://skyward.canyonsdistrict.org/",
            "https://twitter.com/?lang=en",
            "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
   
    }
    
    //MARK:- Table view data source
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of setions
        return 1
    }
    
    override public func tableView(_ tableVie: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let currentText = internetTopics[indexPath.row]
        cell.textLabel!.text = currentText
        
        return cell
    }
    
    //MARK:- Handle the internal tranfer
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier! == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let urlString = addresses[indexPath.row]
                let pageText : String
                
                if indexPath.row == 0
                {
                    //TODO: Replace with your definitions - great time to use the """ operator
                    pageText = "All th definitionyou wrote................"
                }
                else
                {
                    pageText = internetTopics[indexPath.row]
                }
                
                let controller = segue.destination as!
                    InternetDetailViewController
                
                controller.detailAddress = urlString
                controller.detailText = pageText
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }
}
