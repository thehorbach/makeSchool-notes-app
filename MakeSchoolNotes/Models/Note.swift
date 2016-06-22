//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Vyacheslav Horbach on 22/06/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}