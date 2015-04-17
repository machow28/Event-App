//
//  EventsViewController.swift
//  EventsApp
//
//  Created by mchow on 4/15/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    var eventsArray = [Event]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if PFUser.currentUser() == nil
        {
            performSegueWithIdentifier("EventsToRegisterSegue", sender: self)
        }
        else
        {
            setEventData()
        }
    }
    
    func setEventData()
    {
        Event.queryForEvents { (events, error) -> Void in
            self.eventsArray = events as [Event]
            self.tableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as eventTableViewCell
       let event = eventsArray[indexPath.row] as Event
        cell.eventNameLabel.text = event.title
        cell.eventDateLabel.text = event.date.toStringOfMonthDayAndTime()
        
        event.eventPicFile.getDataInBackgroundWithBlock { (data, error) -> Void in
            cell.eventImageView.image = UIImage(data: data)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
}
