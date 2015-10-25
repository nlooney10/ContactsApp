//
//  DetailViewController.swift
//  Contacts
//
//  Created by Nick Looney on 10/18/15.
//  Copyright © 2015 Nick Looney. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    var contact: Contacts?
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.nameField {
            self.contact?.contactName = textField.text
        } else if textField == self.phoneNumberField {
            self.contact?.contactNumber = textField.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.phoneNumberField.delegate = self
        
        // Check if contact has a value
        if let contact = self.contact { // Still kinda confused about this line
            if let name = contact.contactName {
                // Set the name to the name found
                self.nameField.text = name
            }
            if let phoneNumber = contact.contactNumber {
                // Set the number to the number found
                self.phoneNumberField.text = phoneNumber
            }
            else {
                self.phoneNumberField.text = "No Phone Number"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
