//
//  ViewController.swift
//  workspaceProject
//
//  Created by Jonathan Yee on 3/7/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//  gravity: The total acceleration of the device is equal to gravity plus the aceleration the user imparts to the device
//
//  userAcceleration: the acceleration that the user is giving the device. The total acceleration of the device is equal to gravity plus the acceleration the user imparts on the device
//
//  How does the function know to continue to update using the startReadingMotionData():: Stop with function stopDeviceMotionUpdates
//
//  rotationRate: the spike we're looking for is in z, clockwise is -z and counterclockwise is +z
// updated update interval

// full rotation: [8,8,5,17,9,12,9,10,7,8] : if z is 9.3

// half rotation: [4,6,7,9,12,3, 3,9,10,13]: if z is 7.6

// quarter rotation: [1,1,0,2,2,4,1,2,6,2]: if z is 2

// HIGH rotation: [25,27,18,27,21,15,18,24,24]: if z is 19.9

// two settings 13 below, 13 above

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager() // starts the services that report movement detected by the device's onboard sensors. Four types of motion data, interested in two: [Accelerometer Data,and Device-motion Data]
    let opQueue = OperationQueue() // a queue that regulates the execution of a set of operations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isDeviceMotionAvailable { //if the device detects motion when loaded
            print("We can detect device motion")
            startReadingMotionData()
        }
        else { //if the device doesn't detect motion when loaded
            print("We cannot detect device motion")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startReadingMotionData() {
        // set read speed
        motionManager.deviceMotionUpdateInterval = 0.25 //checks motion every x/second
        // start reading
        motionManager.startDeviceMotionUpdates(to: opQueue) { //start creating updates
            (data: CMDeviceMotion?, error: Error?) in
            
            if let mydata = data {
                print("myZdata is ", mydata.rotationRate.z)//looking at ONLY the z-axis data
                //                print("pitch raw", mydata.attitude.pitch)
                //                print("pitch", self.degrees(mydata.attitude.pitch))
                
                if mydata.rotationRate.z > 5 {
                    print("WE SPINNINININNINININGGGGG") //insert sound here
                }
                
            }
        }
    }
    
    
    func degrees(_ radians: Double) -> Double {
        return 180/Double.pi * radians
    }
    
}
