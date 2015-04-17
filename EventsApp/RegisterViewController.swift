//
//  RegisterViewController.swift
//  EventsApp
//
//  Created by mchow on 4/15/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController
{

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonTapped(sender: UIButton)
    {
        if usernameTextField.text == "" || passwordTextField.text == ""
        {
            showAlert("Please enter username and password", nil, self)
        }
        else
        {
            User.registerNewUser(usernameTextField.text, password: passwordTextField.text, completed: { (result, error) -> Void in
                if error != nil
                {
                    showAlertWithError(error, self)
                }
                else
                {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }


}
