//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension VaporEcobee.Developers {

    /**
    Refreshing Your Tokens

    All access tokens must be refreshed periodically. Token refresh reduces the potential and benefit of token theft. Since all tokens expire, stolen tokens may only be used for a limited time. A token refresh immediately expires the previously issued access and refresh tokens and issues brand new tokens.
    */
    public enum RefreshToken {

        public static let service = APIService<Response>(id: "refreshToken", tag: "developers", method: "POST", path: "/token", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The grant type */
                public var grantType: String

                /** The token which we received in a prior token exchange call */
                public var refreshToken: String

                /** The client ID which represents the app requesting the asset */
                public var clientId: String

                /** The code from the original oauth flow */
                public var code: String?

                public init(grantType: String, refreshToken: String, clientId: String, code: String? = nil) {
                    self.grantType = grantType
                    self.refreshToken = refreshToken
                    self.clientId = clientId
                    self.code = code
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RefreshToken.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(grantType: String, refreshToken: String, clientId: String, code: String? = nil) {
                let options = Options(grantType: grantType, refreshToken: refreshToken, clientId: clientId, code: code)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["grant_type"] = options.grantType
                params["refresh_token"] = options.refreshToken
                params["client_id"] = options.clientId
                if let code = options.code {
                  params["code"] = code
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [AccessTokenRequest]

            /** search results matching criteria */
            case status200([AccessTokenRequest])

            /** bad input parameter */
            case status400

            public var success: [AccessTokenRequest]? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode([AccessTokenRequest].self, from: data))
                case 400: self = .status400
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
