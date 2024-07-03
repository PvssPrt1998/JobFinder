//
//  SalaryCoreData+CoreDataProperties.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//
//

import Foundation
import CoreData


extension SalaryCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SalaryCoreData> {
        return NSFetchRequest<SalaryCoreData>(entityName: "SalaryCoreData")
    }

    @NSManaged public var full: String
    @NSManaged public var short: String?
    @NSManaged public var vacancy: VacancyCoreData?

}

extension SalaryCoreData : Identifiable {

}
