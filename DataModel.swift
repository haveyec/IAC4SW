//
//  DataModel.swift
//  InspiringAppsTest
//
//  Created by Marlon Henry on 1/28/22.
//

import Foundation
// MARK: - Holiday
struct Holiday: Codable {
    var name, nameLocal, language, holidayDescription: String
    var country, location, type, date: String
    var dateYear, dateMonth, dateDay, weekDay: String

    enum CodingKeys: String, CodingKey {
        case name
        case nameLocal = "name_local"
        case language
        case holidayDescription = "description"
        case country, location, type, date
        case dateYear = "date_year"
        case dateMonth = "date_month"
        case dateDay = "date_day"
        case weekDay = "week_day"
    }
}

typealias Holidays = [Holiday]
