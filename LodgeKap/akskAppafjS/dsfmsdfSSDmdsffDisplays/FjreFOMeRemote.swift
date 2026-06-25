import SwiftUI
import StoreKit

public struct FjreFOMeRemote: Codable, Hashable, Identifiable {
    public let id: String
    public let icon: String
    public let name: String
    public let secondsPerStep: Int
    public let steps: [String]
}

public struct FICodingComplication_Obj325: Codable, Hashable, Identifiable {
    public let id: String?
    public let title: String?
    public let synopsis: String?
    public let symbol: String?
    public let readMinutes: Int?
    public let tags: [String]?
    public let bodyMarkdown: String?
}

public struct FJInstallations_FObjectHelper: Codable, Hashable {
    public let dailyGoal: Int
    public let season: String?
    public let privacyUrl: String?
}

public struct FJMock_ModelSessionResumption: Codable, Hashable {
    public let rituals: [FjreFOMeRemote]?
    public let tales: [FICodingComplication_Obj325]?
    public let config: FJInstallations_FObjectHelper?
}

public final class JJFCinfigureJFJJFContainterAggregate {
    public static let shaIFapprend_gfdgdfg = JJFCinfigureJFJJFContainterAggregate()

    private let remoteEndpointURL = URL(string: "https://colojourney.com/appconfig")!

    private let userDefaultsStorage = UserDefaults.standard
    private let userDefaultsPayloadKey = "MOUNTColorado.remoteContentEnvelope.payload.v2"

    private let jsonDecoder: JSONDecoder = {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .useDefaultKeys
        return d
    }()

    private let jsonEncoder: JSONEncoder = {
        let e = JSONEncoder()
        e.outputFormatting = [.withoutEscapingSlashes]
        return e
    }()

    private init() {}

    @discardableResult
    public func fetchDecodeAndPersiJjjxjstRemoteContemxntEnvelope()
    async throws -> FJMock_ModelSessionResumption {
        var request = URLRequest(url: remoteEndpointURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        if let raw = String(data: data, encoding: .utf8) {
        }

        let envelope = try decodeEnvelopeOrConfig(from: data)
        try persistDecodedEnvelopeToUserDefaults(envelope)
        return envelope
    }

    private func decodeEnvelopeOrConfig(from data: Data) throws -> FJMock_ModelSessionResumption {
        if let env = try? jsonDecoder.decode(FJMock_ModelSessionResumption.self, from: data),
           env.config != nil {
            return env
        }
        let cfg = try jsonDecoder.decode(FJInstallations_FObjectHelper.self, from: data)
        return FJMock_ModelSessionResumption(rituals: nil, tales: nil, config: cfg)
    }

    public func loadPeevreventEnvelopeFromUserDefaults()
    -> FJMock_ModelSessionResumption? {
        guard let data = userDefaultsStorage.data(forKey: userDefaultsPayloadKey) else { return nil }
        return try? jsonDecoder.decode(FJMock_ModelSessionResumption.self, from: data)
    }

    public func loadCachedSeason() -> String? {
        guard let env = loadPeevreventEnvelopeFromUserDefaults() else { return nil }
        return env.config?.season
    }

    public func clearPersistedRemoteContentEnvelopeFromUserDefaults() {
        userDefaultsStorage.removeObject(forKey: userDefaultsPayloadKey)
    }

    private func persistDecodedEnvelopeToUserDefaults(_ envelope: FJMock_ModelSessionResumption) throws {
        let data = try jsonEncoder.encode(envelope)
        userDefaultsStorage.set(data, forKey: userDefaultsPayloadKey)
    }
}
