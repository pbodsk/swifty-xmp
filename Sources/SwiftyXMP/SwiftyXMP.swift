import Foundation
import Clibxmp

public struct SwiftyXMP {
  private var context: XMPContext

  public init() {
    self.context = XMPContext.initFromXMPContext(xmp_create_context())
  }

  public func load(_ fileURL: URL) throws {
    guard var filePath = fileURL.absoluteString.cString(using: .utf8) else {
      throw XMPErrors.invalidURL(url: fileURL)
    }

    let result = xmp_load_module(context.xmp_context, &filePath)
    if result != 0 {
      throw XMPErrors.loadError(returnCode: Int(result))
    }



    //var filePath = "/Users/peter/Desktop/enigma.mod".cString(using: .utf8)!
    //var frameInfo: xmp_frame_info = xmp_frame_info()
  }
}
