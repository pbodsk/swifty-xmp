import Foundation
import Clibxmp

public struct SwiftyXMP {
  private var context: XMPContext
  private var frameInfo: xmp_frame_info = xmp_frame_info()

  public init() {
    self.context = XMPContext.initFromXMPContext(xmp_create_context())
  }

  public func load(_ fileURL: URL) throws {
    guard var filePath = fileURL.relativePath.cString(using: .utf8) else {
      throw XMPErrors.invalidURL(url: fileURL)
    }

    let result = xmp_load_module(context.xmp_context, &filePath)
    if result != 0 {
      throw XMPErrors.loadError(returnCode: Int(result))
    }
  }

  public func start() {
    xmp_start_player(context.xmp_context, 44100, 0)
  }

  public mutating func playFrame() throws -> XMPFrameInfo {
    let result = xmp_play_frame(context.xmp_context)

    if result == 0 {
      xmp_get_frame_info(context.xmp_context, &frameInfo)
      return XMPFrameInfo(frameInfo)
    } else {
      throw XMPErrors.playFrameError(returnCode: Int(result))
    }
  }

  public func stop() {
    xmp_stop_module(context.xmp_context)
  }
}
