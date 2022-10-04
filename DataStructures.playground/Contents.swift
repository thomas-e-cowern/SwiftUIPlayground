import Foundation

// LINKED LISTS

// LIST NODE
final class LinkedListNode<Element> {
    var value: Element
    var next: LinkedListNode?
    
    init(value: Element, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

// LiST
final class LinkedList<Element> {
    var start: LinkedListNode<Element>?
}



