Class {
	#name : 'WsListModel',
	#superclass : 'Object',
	#instVars : [
		'items',
		'addPort'
	],
	#category : 'WebST-Library-Lists',
	#package : 'WebST-Library',
	#tag : 'Lists'
}

{ #category : 'adding' }
WsListModel >> add: itemModel [

	items addLast: itemModel.
	addPort notifyWithAll:{
			itemModel. items size}.
]

{ #category : 'adding' }
WsListModel >> addAll: itemModels [

	itemModels do: [ :each | self add: each ]
]

{ #category : 'initialization' }
WsListModel >> initialize [

	super initialize.
	items := OrderedCollection new.
	addPort := HyCollectionPort notificationSelector: #value:value:
]

{ #category : 'accessing' }
WsListModel >> itemAt: index [

	^ self items at: index
]

{ #category : 'accessing' }
WsListModel >> items [

	^ items
]
