//
//   Endpoints.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/12/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//
import Foundation
import Alamofire

struct API {
    static let baseUrl = "http://api.irishrail.ie/realtime/realtime.asmx/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints: URLRequestConvertible
{

    case GetRailStationData(String, Int)
    // Computed property returns the method for each case

    func asURLRequest() throws -> URLRequest
    {
        var method:Alamofire.HTTPMethod
        {
            switch self {
            case .GetRailStationData:
                return .get
            }
        }
        
        let params: ([String:String]?) = {
            switch self {
            case .GetRailStationData(let stationCode, let minutes):
                return ["StationCode" : stationCode, "NumMins" : String(minutes)]
            }
        }()
        
        let url:URL = {
           
            //Creating URL Request
            let relativePath:String?
            
            switch self
            {
            case .GetRailStationData:
                relativePath = "getStationDataByCodeXML_WithNumMins"
            }
            
            var url = URL(string:API.baseUrl)!
            if let rp = relativePath {
                url = url.appendingPathComponent(rp)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding:ParameterEncoding = {
            switch self {
            case .GetRailStationData(_):
                return Alamofire.URLEncoding.default
            }
        }()
        let encodedRequest = try encoding.encode(urlRequest, with: params)
        return encodedRequest
    }

}
