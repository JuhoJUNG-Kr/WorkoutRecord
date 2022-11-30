//
//  WorkoutManager.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//

import UIKit

class WorkoutManager {
    
    
    let chestData = Workout(workoutImg: UIImage(named: "benchPress.png"), workoutName: "Bench Press", workoutDescription: "Chest")
    
    let backData = Workout(workoutImg: UIImage(named: "deadLift.png"), workoutName: "Dead Lift", workoutDescription: "Back")
    let sholdersData = Workout(workoutImg: UIImage(named: "militaryPress.png"), workoutName: "Military Press", workoutDescription: "Sholders")
    let legsData = Workout(workoutImg: UIImage(named: "Squat.png"), workoutName: "Squat", workoutDescription: "Legs")
    let armsData = Workout(workoutImg: UIImage(named: "barbellCurl.png"), workoutName: "Barbell Curl", workoutDescription: "Arms")

}
