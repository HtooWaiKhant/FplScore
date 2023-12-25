//
//  NetworkConstants.swift
//  Fpl
//
//  Created by Macbook on 12/22/23.
//


import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            //Put your own API key here
            return ""
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://hammerhead-app-xnriz.ondigitalocean.app/api/" //player/scores
        }
    }
}
