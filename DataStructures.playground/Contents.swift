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

let third = LinkedListNode(value: 5)
let second = LinkedListNode(value: 3, next: third)
let first = LinkedListNode(value: 1, next: second)
let list = LinkedList<Int>()

list.start = first

var currentNode = list.start

while let node = currentNode {
    print(node.value, terminator: " ")
    currentNode = node.next
}

