//
//  ViewController.swift
//  Stormy
//
//  Created by David Muro II on 1/19/15.
//  Copyright (c) 2015 David Muro II. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Add API access control — Public, Internal and Private access key
    private let apiKey = "fa9d2b8f7c88c76b57ed83b9bd842f35"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Get the weather from forecast.io for Alcatraz island
//          let forecastURL = "https://api.forecast.io/forecast/fa9d2b8f7c88c76b57ed83b9bd842f35/37.8267,-122.423"
        
        // Chop up the forecastURL into bite sized pieces
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // Create a session manager. A Singleton (the sharedSession() creates one reference to an instance, no matter where or how many times it's called. Use with caution.
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if (error == nil) {
                
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
                let currentWeather = Current(weatherDictionary: weatherDictionary)
                println(currentWeather.currentTime)
                
                
                // shouldn't use a black box solution like this, because we can't see what data it contains and we can't easily update code if there are changes to the API. Best to create a Struct in this instance.
//                let currentWeatherDictionary: NSDictionary = weatherDictionary["currently"] as NSDictionary
                
            }
            
//            var urlContents = NSString(contentsOfURL: NSURL, encoding: UInt, error: NSErrorPointer)
//            println(urlContents)
            
        })
        
        downloadTask.resume()
        
        // closures: { (parameters) -> return type in statements }\
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

