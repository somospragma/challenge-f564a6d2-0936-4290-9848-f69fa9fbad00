import Foundation

public enum NetworkError: Error {
    case apiError(Error)
    case decodingError
    case unknown

    public init(_ error: Error) {
        if let urlError = error as? URLError {
            self =.apiError(urlError)
        } else if let decodingError = error as? DecodingError {
            self =.decodingError
        } else {
            self =.unknown
        }
    }
}