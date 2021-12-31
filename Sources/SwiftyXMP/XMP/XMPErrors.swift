import Foundation

public enum XMPErrors: Error {
  case invalidURL(url: URL)
  case loadError(returnCode: Int)
}
