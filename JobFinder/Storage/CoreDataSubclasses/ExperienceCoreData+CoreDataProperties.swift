//
//  ExperienceCoreData+CoreDataProperties.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//
//

import Foundation
import CoreData


extension ExperienceCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExperienceCoreData> {
        return NSFetchRequest<ExperienceCoreData>(entityName: "ExperienceCoreData")
    }

    @NSManaged public var previewText: String
    @NSManaged public var text: String
    @NSManaged public var vacancy: VacancyCoreData?

}

extension ExperienceCoreData : Identifiable {

}
