//
//  File.swift
//  InspiringAppsTest
//
//  Created by Marlon Henry on 1/28/22.
//

import Foundation

class FetchHolidays: ObservableObject {
    @Published var dataArray = [Holiday]()
    //AIzaSyBsomT-4AXUhBp8ZtLG8Ev6eUBG-gj1z84
    
    init(){
        guard let url = URL(string: "https://holidays.abstractapi.com/v1/?api_key=b540d176b0e14e39abb285dafb670439&country=US&year=2020")else{return}
       // var request = URLRequest(url: url)
//        request.addValue(apiKey, forHTTPHeaderField: "key")
        let task = URLSession.shared.dataTask(with: url) { [self] data, response, err in
            
            guard let dataOb = data else{return}
            
            let decoder = JSONDecoder()
            do {
                
                let holidayData = try decoder.decode(Array<Holiday>.self, from: dataOb)
                DispatchQueue.main.async {
                    dataArray = holidayData
                }

            } catch(let error)  {
                print("DANGER  Will Robinson")
                print("\(error)")
                
            }
            
        }
        task.resume()
    }
}
