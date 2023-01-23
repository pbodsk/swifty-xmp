import Foundation
import Clibxmp

public struct SwiftyXMP {
  private var context: XMPContext
  private var frameInfo: xmp_frame_info = xmp_frame_info()
  private var _moduleInfo: xmp_module_info = xmp_module_info()

  // MARK: - creating and destruction
  public init() {
    self.context = XMPContext.initFromXMPContext(xmp_create_context())
  }

  public func freeContext() {
    xmp_free_context(context.xmp_context)
  }

  // MARK: - Load
  public func load(_ fileURL: URL) throws {
    guard var filePath = fileURL.relativePath.cString(using: .utf8) else {
      throw XMPErrors.invalidURL(url: fileURL)
    }

    let result = xmp_load_module(context.xmp_context, &filePath)
    if result != 0 {
      throw XMPErrors.loadError(returnCode: Int(result))
    }
  }

  public func releaseCurrentModule() {
    xmp_release_module(context.xmp_context)
  }

  // MARK: - Play controls
  public func start() {
    xmp_start_player(context.xmp_context, 44100, 0)
    xmp_set_player(context.xmp_context, XMP_PLAYER_MIX, 0)
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

  public func restart() {
    xmp_restart_module(context.xmp_context)
  }

  public func nextPosition() -> Int32 {
    xmp_next_position(context.xmp_context)
  }

  public func previousPosition() -> Int32 {
    xmp_prev_position(context.xmp_context)
  }

  public func seek(to time: Int32) throws -> Int32 {
    let newPositionIndex = xmp_seek_time(context.xmp_context, time)
    guard newPositionIndex != XMP_ERROR_STATE else {
      throw XMPErrors.invalidState
    }
    return newPositionIndex
  }

  // MARK: - Channel controls
  public func updateChannel(_ channel: Int32, to newState: XMPChannelState) throws -> XMPChannelState? {
    let previousChannelState = xmp_channel_mute(context.xmp_context, channel, newState.rawValue)
    guard previousChannelState != XMP_ERROR_STATE else {
      throw XMPErrors.invalidState
    }
    return XMPChannelState(rawValue: previousChannelState)
  }

  // MARK: - Module information

  public mutating func moduleInfo() -> XMPModuleInfo {
    xmp_get_module_info(context.xmp_context, &_moduleInfo)
    return XMPModuleInfo(_moduleInfo)
  }

  public var supportedModuleFormats: [String] {
    var supportedFormats = [String]()
    if var ptr = xmp_get_format_list() {
      while let s = ptr.pointee {
        supportedFormats.append(String(cString: s))
        ptr += 1
      }
    }
    return supportedFormats
  }
}
