//
//  VocabularyWordEntity+CoreDataProperties.swift
//  LearningCoreData
//
//  Created by Crossley Rozario on 5/3/24.
//
//

import Foundation
import CoreData


extension VocabularyWordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VocabularyWordEntity> {
        return NSFetchRequest<VocabularyWordEntity>(entityName: "VocabularyWordEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var definition: String?

}

extension VocabularyWordEntity : Identifiable {

}
