//
//  SerializableUtils.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ResponseObjectSerializable {
    init?(fromJSON json:JSON)
    static func collectionTemp(fromJSON json:JSON) -> [Self]?
}

protocol ResponseCollectionSerializable {
    static func collection(fromJSON json:JSON) -> [Self]?
}

extension ResponseObjectSerializable {
    static func collectionTemp(fromJSON json:JSON) -> [Self]? {
        var items:[Self] = []
        guard let itemsJSON = json.array else {
            print(json)
            return nil
        }
        for itemJSON in itemsJSON {
            if let item = Self(fromJSON: itemJSON) {
                items.append(item)
            }
        }
        return items
    }

}

extension ResponseCollectionSerializable where Self:ResponseObjectSerializable {
    
    static func collection(fromJSON json:JSON) -> [Self]? {
        var items:[Self] = []
        guard let itemsJSON = json.array else {
            print(json)
            return nil
        }
        for itemJSON in itemsJSON {
            if let item = Self(fromJSON: itemJSON) {
                items.append(item)
            }
        }
        return items
    }
}

extension DataRequest {
    
    func responseListObject<T: ResponseObjectSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            let json = JSON(jsonObject)
            
            guard let responseObject = T.collectionTemp(fromJSON: json) else {
                return .failure(BackendError.objectSerialization(reason: "JSON could not be serialized: \(json)"))
            }
            
            return .success(responseObject)
        }
        
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
    func responseCreateObject<T: ResponseObjectSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            let json = JSON(jsonObject)
            
            guard let responseObject = T.init(fromJSON: json) else {
                
                let error = json.array
                print(error as Any)
                var errorArray = [String]()
                for value in error! {
                    
                    let field = value["field"].string
                    let message = value["message"].string
                    
                    let errorText = "\(field ?? "") \(message ?? "")"
                    errorArray.append(errorText)
                }
                
                print(errorArray)
                if errorArray.count > 1 {
                    let errorStr = errorArray.joined(separator: "\n")
                    let e = NSError(domain: errorStr, code: 0)
                    return .failure(e)
                }
                else{
                    let e = NSError(domain: "\(errorArray.first ?? "")", code: 0)
                    return .failure(e)
                }
                
                
            }
            
            return .success(responseObject)
        }
        
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
}

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case jsonSerialization(error: Error)
    case objectSerialization(reason: String)
}

