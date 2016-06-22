//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {

    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel btn tapped")
            } else if identifier == "Save" {
                print("Save btn tapped")
                
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text
                note.modificationTime = NSDate()
                
                let listNotesTableVC = segue.destinationViewController as! ListNotesTableViewController
                listNotesTableVC.notes.append(note)
            }
        }
    }

}
