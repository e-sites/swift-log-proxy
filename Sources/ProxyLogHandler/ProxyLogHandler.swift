import Foundation
import Logging

public struct ProxyLogHandler: LogHandler, Sendable {
    public var metadata = Logger.Metadata()
    public var logLevel = Logger.Level.info
    public var label: String
    private var handler: (@Sendable (Logger.Level, Logger.Message, Logger.Metadata?, String, String, String, UInt) -> Void)
    
    public init(label: String, handler: @escaping (@Sendable (Logger.Level, Logger.Message, Logger.Metadata?, String, String, String, UInt) -> Void)) {
        self.label = label
        self.handler = handler
    }
    
    public func log( // swiftlint:disable:this function_parameter_count
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata?,
        source: String,
        file: String,
        function: String,
        line: UInt
    ) {
        handler(level, message, metadata, source, file, function, line)
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
