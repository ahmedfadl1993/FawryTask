//
//  APIFetcher.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//
import Alamofire

class APIFetcher {
    
    static let instance = APIFetcher()
    typealias apiSuccess = (_ result: Data?) -> Void
    typealias apiFailure = (_ error: ErrorResponse?) -> Void
    
    func request(request: BaseRequestProtocol,
                 onSuccess successCallback: @escaping apiSuccess,
                 onFailure failureCallback: @escaping apiFailure) {
        
        AF.request(request.url, method: request.method, parameters: request.parameters, encoding: JSONEncoding.default, headers: request.headers).validate().responseData { response in
            switch response.result {
            case .success(let value):
                successCallback(value)
            case .failure(let error):
                let statusCode = response.response?.statusCode ?? 400
                failureCallback(ErrorResponse(statusCode: statusCode, message: error.localizedDescription))
            }
        }
        
    }
}

