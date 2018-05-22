//
//  NetworkClient.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 5/18/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation
import CFNetwork

class NetworkClient : NSObject, StreamDelegate
{
    var inputStream: InputStream!
    var outputStream: OutputStream!
    let maxReadLength = 4096

    public func WriteToStream()
    {
        //let data = "Hola<EOF>".data(using: .ascii)!
        let data = "GET / HTTP/1.1\r\nHost: www.google.com\r\nContent-Length: 0\r\n\r\n<EOF>".data(using: .ascii)!
        _ = data.withUnsafeBytes { outputStream.write($0, maxLength: data.count) }
    }

    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case Stream.Event.hasBytesAvailable:
            print("new message received")
            readAvailableBytes(stream: aStream as! InputStream)
        case Stream.Event.endEncountered:
            print("new message received")
        case Stream.Event.errorOccurred:
            print("error occurred")
        case Stream.Event.hasSpaceAvailable:
            print("has space available")
        default:
            print("some other event...")
            break
        }
    }

    private func readAvailableBytes(stream: InputStream) {
        //1
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxReadLength)

        //2
        while stream.hasBytesAvailable {
            //3
            let numberOfBytesRead = inputStream.read(buffer, maxLength: maxReadLength)

            //4
            if numberOfBytesRead < 0 {
                if let _ = stream.streamError {
                    break
                }
            }

            //Construct the resulting string
            if let message = processedMessageString(buffer: buffer, length: numberOfBytesRead) {
                //Notify interested parties
                print (message)
            }
        }
    }

    private func processedMessageString(buffer: UnsafeMutablePointer<UInt8>,
                                        length: Int) -> String? {
        //1
        let result = String(bytesNoCopy: buffer,
                                       length: length,
                                       encoding: .ascii,
                                       freeWhenDone: true)


        print (result!)
        //2
        return result
    }

    public func InitializeConnection()
    {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        // 2
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "192.168.1.58" as CFString, 8888, &readStream, &writeStream)
        //CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "www.google.com" as CFString, 80, &readStream, &writeStream)

        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()

        inputStream.schedule(in: .current, forMode: .commonModes)
        outputStream.schedule(in: .current, forMode: .commonModes)

        inputStream.open()
        outputStream.open()

        inputStream.delegate = self
    }
}
