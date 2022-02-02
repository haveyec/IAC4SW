//
//  ContentView.swift
//  InspiringAppsTest
//
//  Created by Marlon Henry on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var dayChosen = Date()
    let currentDate = Date()
    let dateComponent = DateComponents(year:2020)
    let dateFormatter = DateFormatter()
    @ObservedObject var fetch = FetchHolidays()
    var body: some View {
        Form{
            DatePicker("Select a date", selection: $dayChosen, in: currentDate...,displayedComponents: .date).datePickerStyle(.graphical)
            Text("\(dayChosen)")
            
            calText(dateOb: dayChosen)
            
        }
        
    }
    
    func calText(dateOb:Date)->Text{
        //        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        
        //Filter out dataArry to find the object that matches dayChosen then apend that object name to the Text for holiday name and we're done.
        
        let filtered = fetch.dataArray.filter {
            return dateFormatter.date(from: $0.date) == dateFormatter.date(from: "\(dayChosen)")
        }
        
        if let holiday = filtered.first{
            return Text("This is a holiday around these parts \(holiday.name)")
        }else{
            return  Text("Eh regular")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
