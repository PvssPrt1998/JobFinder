//
//  VacancyCoreData+CoreDataProperties.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//
//

import Foundation
import CoreData


extension VacancyCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VacancyCoreData> {
        return NSFetchRequest<VacancyCoreData>(entityName: "VacancyCoreData")
    }

    @NSManaged public var id: String
    @NSManaged public var lookingNumber: Int32
    @NSManaged public var title: String
    @NSManaged public var company: String
    @NSManaged public var publishedDate: String
    @NSManaged public var isFavorite: Bool
    @NSManaged public var appliedNumber: Int32
    @NSManaged public var vacancyDescription: String?
    @NSManaged public var responsibilities: String
    @NSManaged public var schedules: [NSString]
    @NSManaged public var questions: [NSString]
    @NSManaged public var address: AddressCoreData
    @NSManaged public var experience: ExperienceCoreData
    @NSManaged public var salary: SalaryCoreData
}

extension VacancyCoreData : Identifiable {

}
