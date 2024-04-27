Class {
	#name : #WsToDoItemModel,
	#superclass : #WsTextModel,
	#instVars : [
		'isChecked',
		'isCheckedPort'
	],
	#category : #'WebSt-Examples-ToDoList'
}

{ #category : #initialization }
WsToDoItemModel >> initialize [

	super initialize.
	isChecked := false.
	isCheckedPort := HyCollectionPort notificationSelector: #value:
]

{ #category : #accessing }
WsToDoItemModel >> isChecked [

	^ isChecked
]

{ #category : #accessing }
WsToDoItemModel >> isChecked: aBoolean [

	isChecked := aBoolean.
	isCheckedPort notifyWith: isChecked 
]
