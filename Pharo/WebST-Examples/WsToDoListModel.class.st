Class {
	#name : #WsToDoListModel,
	#superclass : #WsListModel,
	#instVars : [
		'heading',
		'headingPort'
	],
	#category : #'WebST-Examples-ToDoList'
}

{ #category : #accessing }
WsToDoListModel >> heading [
	^heading
]

{ #category : #accessing }
WsToDoListModel >> heading: newTitle [

	heading := newTitle.
	headingPort notifyWith: newTitle
]

{ #category : #initialization }
WsToDoListModel >> initialize [

	super initialize.
	heading := 'ToDo List'.
	headingPort := HyCollectionPort notificationSelector: #value:
]
