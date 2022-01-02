import Foundation

public enum XMPErrors: Error {
  case invalidURL(url: URL)
  case loadError(returnCode: Int)
  case playFrameError(returnCode: Int)
}
