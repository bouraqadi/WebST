Class {
	#name : #WsUrlDisplayWindowComponent,
	#superclass : #WsWindowComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Library-Windows'
}

{ #category : #accessing }
WsUrlDisplayWindowComponent class >> defaultUrl [
	^'https://github.com/bouraqadi/WebST/blob/pharo11/README.md'
]

{ #category : #'class initialization' }
WsUrlDisplayWindowComponent class >> tagName [

	^ 'ws-object-window'
]

{ #category : #accessing }
WsUrlDisplayWindowComponent class >> viewClass [

	<pharoJsSkip>
	^ WsUrlDisplayWindowView
]

{ #category : #accessing }
WsUrlDisplayWindowComponent >> defaultUrl [

	^ self class defaultUrl
]

{ #category : #initialization }
WsUrlDisplayWindowComponent >> initView [ 
	super initView.
	self object data: self url
]

{ #category : #accessing }
WsUrlDisplayWindowComponent >> object [

	^ view querySelector: 'object'
]

{ #category : #accessing }
WsUrlDisplayWindowComponent >> url [
	^self dataAttributeAt: #url ifAbsent: [ self defaultUrl ]
]
