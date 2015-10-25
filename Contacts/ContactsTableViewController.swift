//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Nick Looney on 10/18/15.
//  Copyright © 2015 Nick Looney. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    var contacts: [Contacts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jenny = Contacts(contactNumber: "867-5309")
        let rich = Contacts(contactName: "Rich", contactNumber: "888-888-8888")
        let mindy = Contacts(contactName: "Mindy")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)
        
        let editButton = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "editButtonTapped:")
        self.navigationItem.rightBarButtonItem = editButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("addContact"))
        navigationItem.leftBarButtonItem = addButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func editButtonTapped(sender: UIBarButtonItem){
        self.tableView.setEditing(!tableView.editing, animated: true)
        if (tableView.editing){
            sender.title = "Done"
        }
        else{
            sender.title = "Edit"
        }
        print("Button Tapped")
    }
    
    func addContact() {
        let newContact = Contacts(contactName: "New Contact")
        self.contacts.append(newContact)
        let newIndexPath = NSIndexPath(forRow: self.contacts.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let contact = self.contacts[indexPath.row]
        
        if let name = contact.contactName {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let tempContact = contacts[fromIndexPath.row]
        contacts.removeAtIndex(fromIndexPath.row)
        contacts.insert(tempContact, atIndex: toIndexPath.row)
        print(contacts)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get index path of selected cell
        let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        // Get the contact selected
        let contact = self.contacts[indexPath.row]
        // Get the DetailViewController from the segue
        let destination = segue.destinationViewController as! DetailViewController
        // Set the contact property of the detail view to the contact selected
        destination.contact = contact
    }

}
