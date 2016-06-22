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
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
            
        } else {
            
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listNotesTableVC = segue.destinationViewController as! ListNotesTableViewController
        
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel btn tapped")
            } else if identifier == "Save" {
                print("Save btn tapped")
                
                if let oldNote = note {
                    oldNote.content = noteContentTextView.text ?? ""
                    oldNote.title = noteTitleTextField.text ?? ""
                    
                    listNotesTableVC.tableView.reloadData()
                } else {
                
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text
                    newNote.modificationTime = NSDate()

                    let listNotesTableVC = segue.destinationViewController as! ListNotesTableViewController
                    listNotesTableVC.notes.append(newNote)
                }
            }
        }
    }

}
