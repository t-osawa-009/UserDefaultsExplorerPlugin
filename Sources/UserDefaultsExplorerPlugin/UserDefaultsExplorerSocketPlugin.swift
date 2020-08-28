import Foundation
import CocoaAsyncSocket

public class UserDefaultsExplorerSocketPlugin: NSObject {
    // MARK: - public
    public func send(data: Data) {
        sockets.forEach { (_s) in
            _s.write(data, withTimeout: -1.0, tag: 0)
        }
    }
    
    public func start() {
        services.removeAll(keepingCapacity: true)
        sockets.removeAll(keepingCapacity: true)
        
        let _serviceBrowser = NetServiceBrowser()
        _serviceBrowser.delegate = self
        _serviceBrowser.searchForServices(ofType: type, inDomain: domain)
        serviceBrowser = _serviceBrowser
    }
    
    public func retry() {
        serviceBrowser?.stop()
        serviceBrowser = nil
        start()
    }
    
    // MARK: - initializer
    public convenience init(type: String, domain: String) {
        self.init()
        self.type = type
        self.domain = domain
        start()
    }
    
    private override init() {
        super.init()
    }
    
    // MARK: - private
    private func isConnected(service: NetService) -> Bool {
        let addresses = service.addresses ?? []
        if addresses.isEmpty {
            return false
        }
        
        var _isConnected = false
        let socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        for i in addresses {
            do {
                try socket.connect(toAddress: i)
                sockets.append(socket)
                _isConnected = true
            } catch {
                
            }
        }
        return _isConnected
    }
    
    private var type: String!
    private var domain: String!
    private var services: [NetService] = []
    private var sockets: [GCDAsyncSocket] = []
    private var serviceBrowser: NetServiceBrowser?
}

extension UserDefaultsExplorerSocketPlugin: GCDAsyncSocketDelegate, NetServiceDelegate, NetServiceBrowserDelegate {
    public func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        sock.delegate = nil
        sockets = sockets.filter({ $0 !== sock })
    }
    
    public func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        services.append(service)
        service.delegate = self
        service.resolve(withTimeout: 30.0)
    }
    
    public func netServiceBrowser(_ browser: NetServiceBrowser, didRemove service: NetService, moreComing: Bool) {
        services = services.filter({ $0 !== service })
    }
    
    public func netServiceDidResolveAddress(_ sender: NetService) {
        _ = isConnected(service: sender)
    }
    
    public func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        let size = UInt(MemoryLayout<UInt64>.size)
        sock.readData(toLength: size, withTimeout: -1.0, tag: 0)
    }
    
    public func netServiceBrowser(_ browser: NetServiceBrowser, didNotSearch errorDict: [String : NSNumber]) {
        retry()
    }
}
