//
//  ContentView.swift
//

import Combine
import SwiftUI

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
    let url: URL
    let main_image: String
    let published_date: Date
}

struct ContentView: View {
    @State private var requests = Set<AnyCancellable>()
    @State private var items = [NewsItem]()

    var body: some View {
        NavigationView {
            VStack {
                Button("Fetch news") {
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news1.json")
                }

                List(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.strap)
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Hacking with Swift")
        }
    }

    func fetch<T: Decodable>(_ url: URL, defaultValue: T) -> AnyPublisher<T, Never> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
