//
import Foundation
import Network

public protocol CoreTempMonitorSwiftDelegate {
    func didReadData(data: CoreTempObject)
}

public class SocketManager {
    var conn: NWConnection?
    public var delegate: CoreTempMonitorSwiftDelegate?
    
    public convenience init(ip: String, port: String , using: NWParameters) {
        self.init()
        start(ip: ip, port: port, using: using)
    }
    
    func start(ip: String, port: String, using: NWParameters) {
        conn =  NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(port)!, using: using)
        if let conn = conn {
            conn.stateUpdateHandler = self.stateDidChange(to:)
            self.setupReceive(on: conn)
            conn.start(queue: .main)
        }
    }

    func stateDidChange(to state: NWConnection.State) {
        switch state {
        case .setup:
            break
        case .waiting(let error):
            print("Connection did fail: \(error.localizedDescription)")
        case .preparing:
            break
        case .ready:
            print("Connection is ready!!")
        case .failed(let error):
            print("Connection failed: \(error.localizedDescription)")
        case .cancelled:
            break
        @unknown default:
            break
        }
    }

    func setupReceive(on connection: NWConnection) {
        connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { (data, contentContext, isComplete, error) in
            if let data = data, !data.isEmpty {
                do {
                    let decoded = try JSONDecoder().decode(CoreTempObject.self, from: data)
                    self.delegate?.didReadData(data: decoded)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            if isComplete {
                if let conn = self.conn { conn.cancel() }
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                self.setupReceive(on: connection)
            }
        }
    }
    
    public func stop() {
        if let conn = self.conn { conn.cancel() }
    }

}
