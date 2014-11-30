//
//  Wheater.swift
//  LemonadeStandAssignment
//
//  Created by Miguel on 30/11/14.
//  Copyright (c) 2014 mrodriguez. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    enum weatherType {
        case COLD
        case MILD
        case WARM
    }
    
    private var currentWeatherType = weatherType.MILD
    
    init(){
        
        currentWeatherType = createWeather()
    }
    
    func createWeather() -> weatherType{
        
        let randomWeather = Int(arc4random_uniform(UInt32(3)))
        
        switch(randomWeather){
            
            case 0: return weatherType.COLD
            case 1: return weatherType.MILD
            case 2: return weatherType.WARM
            default: return weatherType.MILD
        }
    }
    
    func obtainWeatherType() -> weatherType{
        
        return currentWeatherType
    }
    
    func obtainWeatherImage() -> UIImage{
        
        if(currentWeatherType == weatherType.COLD) {
            return UIImage(named: "cold")!
        }
        else if(currentWeatherType == weatherType.MILD) {
            return UIImage(named: "mild")!
        }
        else if(currentWeatherType == weatherType.WARM) {
            return UIImage(named: "warm")!
        }
        else {
            return UIImage(named: "mild")!
        }
    }
    
}
