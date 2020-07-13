import Foundation
import Logging

public struct ProxyLogHandler: LogHandler {
    public var metadata = Logger.Metadata()
    public var logLevel = Logger.Level.info
    public var label: String
    private var handler: ((Logger.Level, Logger.Message, Logger.Metadata?, String, String, UInt) -> Void)

    public init(label: String, handler: @escaping ((Logger.Level, Logger.Message, Logger.Metadata?, String, String, UInt) -> Void)) {
        self.label = label
        self.handler = handler
    }

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        handler(level, message, metadata, file, function, line)
    }

    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
        get {
            metadata[metadataKey]
        }
        set(newValue) {
            metadata[metadataKey] = newValue
        }
    }
}
