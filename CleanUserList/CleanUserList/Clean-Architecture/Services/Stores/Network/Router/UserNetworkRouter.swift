//
//  UserNetworkRouter.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import Foundation
import Alamofire

enum UserNetworkRouter: URLRequestConvertible {
    
    case getUser
    case creatUser(createUser: CreateUser)
    
    static let baseURL = "https://gorest.co.in/public/v2/"
    
    var path: String {
        switch self {
        case .getUser, .creatUser:
            return "users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .creatUser:
            return .post
        case .getUser:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .creatUser(let user):
            return [
                "name" : user.name,
                "gender" : user.gender,
                "email": user.email,
                "status":"active"
            ]
        case .getUser:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {

        let url = try URL(string: UserNetworkRouter.baseURL.asURL()
                            .appendingPathComponent(path)
                            .absoluteString.removingPercentEncoding!)
        var request = URLRequest.init(url: url!)
        request.httpMethod = method.rawValue

        request.setValue("Bearer 786637fb6fc7d3fda8bca367ac8a41e9c7a2c3cf39b8e185e51ddd662814a69b", forHTTPHeaderField: "Authorization")
                
        return try URLEncoding.default.encode(request,with: parameters)
    }
}

