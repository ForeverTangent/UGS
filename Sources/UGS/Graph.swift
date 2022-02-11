//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 2/7/22.
//

import Foundation
import AppKit


// MARK: - Vertex

/**
	This implimentation of a Vertex structure is based on the Ray Wenderlich - "Data Structures and Algorhythms in Swift"  with  modifications.
 */
public struct Vertex<T: Codable>: Codable, JSONDescription {
	public let index: Int
	public let data: T
}

extension Vertex: Equatable & Comparable {
	public static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
		lhs.index == rhs.index
	}

	public static func < (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
		lhs.index < rhs.index
	}
}

extension Vertex: Hashable where T: Hashable {}

extension Vertex: CustomStringConvertible {
	public var description: String {
		"\(index): \(data)"
	}
}


// MARK: - Edge

public enum EdgeType {
	case directed
	case undirected
}

/**

 This implimentation of a Edge structure is based on the Ray Wenderlich - "Data Structures and Algorhythms in Swift"  with  modifications.

 The category property, if if you want the edges to have a characterization.
 */
public struct Edge<T: Codable>: Codable, JSONDescription {
	public let source: Vertex<T>
	public let destination: Vertex<T>
	public let weight: Double?
	public let category: String?
}

extension Edge: Equatable & Comparable {
	public static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
		lhs.source.index == rhs.source.index &&
		lhs.destination.index == rhs.destination.index
	}

	public static func < (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
		lhs.source.index < rhs.source.index &&
		lhs.destination.index < rhs.destination.index
	}
}


// MARK: - Graph

/**
 This implimentation of a Edge structure is based on the Ray Wenderlich - "Data Structures and Algorhythms in Swift"  with  modifications.

 The Graph is your basic adjacency list type of graph.  Althought adjacency matrixs are good for some algorhtyhms, adjancent list is a better general structure.
 */
public class Graph<T: Hashable & Codable>: Codable, JSONDescription {

	// MARK: - Properties

	private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
	private var vertexes: Set<Vertex<T>> {
		let keyArray = adjacencies.map({ $0.key })
		let keySet = Set(keyArray)
		return keySet
	}

	public init() {}

	// MARK: - Graph Utility Methods

	public func createVertex(data: T) -> Vertex<T> {
		let vertex = Vertex(index: adjacencies.count, data: data)
		adjacencies[vertex] = []
		return vertex
	}

	private func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double? = nil) {
		let edge = Edge(source: source, destination: destination, weight: weight, category: "")
		adjacencies[source]?.append(edge)
	}

	private func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>, weight: Double? = nil) {
		addDirectedEdge(from: source, to: destination, weight: weight)
		addDirectedEdge(from: destination, to: source, weight: weight)
	}

	public func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double? = nil) {
		switch edge {
			case .directed:
				addDirectedEdge(from: source, to: destination, weight: weight)
			case .undirected:
				addUndirectedEdge(between: source, and: destination, weight: weight)
		}
	}

	func removeDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>) {
		if let adjacent = adjacencies[source] {
			adjacencies[source]? = adjacent.filter({ edge in
				edge.source == source && edge.destination == destination
			})
		}
	}

	func removeUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>) {
		if let sourceAdjacent = adjacencies[source] {
			adjacencies[source]? = sourceAdjacent.filter({ edge in
				edge.source == source && edge.destination == destination
			})
		}
		if let destinationAdjacent = adjacencies[destination] {
			adjacencies[destination]? = destinationAdjacent.filter({ edge in
				edge.source == source && edge.destination == destination
			})
		}
	}

	func removeEdge(_ edge: EdgeType = .undirected, from source: Vertex<T>, to destination: Vertex<T>) {
		switch edge {
			case .directed:
				removeDirectedEdge(from: source, to: destination)
			case .undirected:
				removeUndirectedEdge(between: source, and: destination)
		}
	}

	public func edges(from source: Vertex<T>) -> [Edge<T>] {
		adjacencies[source] ?? []
	}

	public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
		edges(from: source).first { $0.destination == destination }?.weight
	}


	// MARK: - Graph Algorhythms


}

extension Graph: CustomStringConvertible {
	public var description: String {
		var result = ""
		for (vertex, edges) in adjacencies.sorted(by: { arg0, arg1 in
			arg0.key < arg1.key
		}) {
			var edgeString = ""
			for (index, edge) in edges.enumerated().sorted(by: { (arg0, arg1) in
				arg0.element < arg1.element
			}) {
				if index != edges.count - 1 {
					edgeString.append("\(edge.destination), ")
				} else {
					edgeString.append("\(edge.destination)")
				}
			}
			result.append("{\(vertex) -> [ \(edgeString) ]}\n")
		}
		return result
	}

}

