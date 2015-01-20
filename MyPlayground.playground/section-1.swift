// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Add API access control — Public, Internal and Private access key
private let apiKey = "fa9d2b8f7c88c76b57ed83b9bd842f35"

// Chop up the forecastURL into bite sized pieces
let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")

let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)