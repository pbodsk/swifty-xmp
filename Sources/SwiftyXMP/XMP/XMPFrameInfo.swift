import Clibxmp

public struct XMPFrameInfo {
  public let bpm: Int32
  public let bufferSize: Int32
  public let buffer: UnsafeMutableRawPointer
  public let frame: Int32
  public let frameTime: Int32
  public var loopCount: Int32
  public var numberOfRows: Int32
  public var numberOfVirtuelChannels: Int32
  public var pattern: Int32
  public var pos: Int32
  public var row: Int32
  public var currentSequence: Int32
  public var speed: Int32
  public let time: Int32
  public var totalSize: Int32
  public var totalTime: Int32
  public var virtuelChannelsUsed: Int32
  public let volume: Int32

  init(_ xmp_frame_info: xmp_frame_info) {
    self.bpm = xmp_frame_info.bpm
    self.bufferSize = xmp_frame_info.buffer_size
    self.buffer = xmp_frame_info.buffer
    self.frame = xmp_frame_info.frame
    self.frameTime = xmp_frame_info.frame_time
    self.loopCount = xmp_frame_info.loop_count
    self.numberOfRows = xmp_frame_info.num_rows
    self.numberOfVirtuelChannels = xmp_frame_info.virt_channels
    self.pattern = xmp_frame_info.pattern
    self.pos = xmp_frame_info.pos
    self.row = xmp_frame_info.row
    self.currentSequence = xmp_frame_info.sequence
    self.speed = xmp_frame_info.speed
    self.time = xmp_frame_info.time
    self.totalSize = xmp_frame_info.total_size
    self.totalTime = xmp_frame_info.total_time
    self.virtuelChannelsUsed = xmp_frame_info.virt_used
    self.volume = xmp_frame_info.volume
  }
}
