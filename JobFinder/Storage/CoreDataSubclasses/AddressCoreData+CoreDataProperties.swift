//
//  AddressCoreData+CoreDataProperties.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//
//

import Foundation
import CoreData


extension AddressCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressCoreData> {
        return NSFetchRequest<AddressCoreData>(entityName: "AddressCoreData")
    }

    @NSManaged public var town: String
    @NSManaged public var street: String
    @NSManaged public var house: String
    @NSManaged public var vacancy: VacancyCoreData?

}

extension AddressCoreData : Identifiable {

}
