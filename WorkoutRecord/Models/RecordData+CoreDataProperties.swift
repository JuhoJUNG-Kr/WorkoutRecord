//
//  RecordData+CoreDataProperties.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//
//

import Foundation
import CoreData


extension RecordData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecordData> {
        return NSFetchRequest<RecordData>(entityName: "RecordData")
    }

    @NSManaged public var recordText: String?
    @NSManaged public var date: Date?
    
    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }

}

extension RecordData : Identifiable {

}
