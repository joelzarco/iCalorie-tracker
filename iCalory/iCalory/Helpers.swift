//
//  Helpers.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 18/07/23.
//

import Foundation

func getTimeSince(date : Date) -> String{
    let minutes = Int(-date.timeIntervalSinceNow) / 60
    let hours = minutes / 60
    let days = hours / 24
    
    if(minutes < 120){
        return "\(minutes) minutes ago"
    }else if(minutes >= 120 && hours < 48){
        return "\(hours) hours ago"
    }else{
        return "\(days) days ago"
        // at leats two days ago to make it easier
    }
}
