//
//  MakeNewProfileViewController.swift
//  UltrasoundClassification
//
//  Created by Mark Chen on 10/31/16.
//  Copyright © 2016 Mark Chen. All rights reserved.
//

import UIKit

protocol MakeNewProfileViewControllerDelegate{
    func myVCDidFinish(controller: MakeNewProfileViewController, text:String)
}

class MakeNewProfileViewController: UIViewController, UITextFieldDelegate{
    var delegate:MakeNewProfileViewControllerDelegate? = nil
    var colorString = "I don't know the color"
    var uniqueIDString = "UniqueID will be generated here"
    var patientStr = "First Last"
    var patientID = "00000"
    var patientDOB = "00/00/00"
    var deviceID = "000"
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var patientNameTextField: UITextField!
    @IBOutlet weak var uniqueIDLabel: UILabel!
    @IBOutlet weak var deviceIDTextField: UITextField!
    @IBOutlet weak var patientDOBTextField: UITextField!
    
    
    
    
    @IBAction func saveProfile(_ sender: UIBarButtonItem) {
        guard let delegate = self.delegate else{
            print ("Delegate for MakeNewProfileViewController not Set")
            return
        }
        delegate.myVCDidFinish(controller: self, text: colorLabel.text!)

    }

    @IBAction func colorSelectionButton(_ sender: UIButton) {
        colorLabel.text = sender.titleLabel!.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorString
        uniqueIDLabel.text = uniqueIDString
        patientNameTextField.delegate = self
        deviceIDTextField.delegate = self
        patientDOBTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing (_ textField: UITextField){
      //patientNameTextField.text = textField.text
        //patientStr = textField.text!
        if (textField.tag == 0){
            patientStr = textField.text!
        } else if(textField.tag == 1){
            patientDOB = textField.text!
        } else if (textField.tag == 2){
           deviceID = textField.text!
        }
    }
    

    @IBAction func nameTextField(_ sender: UITextField) {
    }

    @IBAction func dateOfBirthTextField(_ sender: UITextField) {
    }
    @IBAction func deviceIDTextField(_ sender: UITextField) {
    }

    @IBAction func updateProfileButton(_ sender: UIButton) {
        uniqueIDLabel.text = patientStr + deviceID
    }
    
}

