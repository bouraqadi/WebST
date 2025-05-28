Class {
	#name : 'WsIconTextComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'controller'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsIconTextComponent class >> defaultIconAttribute [

	^ 'bi-emoji-smile'
]

{ #category : 'accessing' }
WsIconTextComponent class >> defaultTextAttribute [

	^ nil
]

{ #category : 'class initialization' }
WsIconTextComponent class >> tagName [

	^'ws-icon-text-row'
]

{ #category : 'accessing' }
WsIconTextComponent class >> viewClass [

	<pharoJsSkip>
	^WsIconTextRowView 
]

{ #category : 'accessing' }
WsIconTextComponent >> controller [
	^controller
]

{ #category : 'accessing' }
WsIconTextComponent >> defaultIconAttribute [

	^ self class defaultIconAttribute
]

{ #category : 'accessing' }
WsIconTextComponent >> defaultTextAttribute [

	^ self class defaultTextAttribute
]

{ #category : 'initialization' }
WsIconTextComponent >> getReady [

	super getReady.
	controller := WsIconTextRowController container: view.
	self icon: self iconAttribute.
	self text: self textAttribute.
]

{ #category : 'accessing' }
WsIconTextComponent >> icon: aString [

	controller icon: aString
]

{ #category : 'accessing' }
WsIconTextComponent >> iconAttribute [

	^ self
		  dataAttributeAt: #icon
		  ifAbsent: [ self defaultIconAttribute ]
]

{ #category : 'accessing' }
WsIconTextComponent >> text [

	^controller text
]

{ #category : 'accessing' }
WsIconTextComponent >> text: aString [

	controller text: aString
]

{ #category : 'initialization' }
WsIconTextComponent >> textAttribute [
	^self dataAttributeAt: #text ifAbsent: [ self defaultTextAttribute ]
]
