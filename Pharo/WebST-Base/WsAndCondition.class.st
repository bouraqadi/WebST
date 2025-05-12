Class {
	#name : 'WsAndCondition',
	#superclass : 'Object',
	#instVars : [
		'elements'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'elements' }
WsAndCondition >> add: aBoolean [

	elements add: aBoolean.
	^ elements size
]

{ #category : 'elements' }
WsAndCondition >> addFalse [

	^self add: false.

]

{ #category : 'elements' }
WsAndCondition >> addTrue [

	^ self add: true
]

{ #category : 'testing' }
WsAndCondition >> ifFalseDo: aBlock [

	self isTrue ifFalse: aBlock
]

{ #category : 'testing' }
WsAndCondition >> ifTrueDo: aBlock [

	self isTrue ifTrue: aBlock
]

{ #category : 'initialization' }
WsAndCondition >> initialize [ 
	super initialize.
	elements := OrderedCollection new
]

{ #category : 'testing' }
WsAndCondition >> isFalse [
	^ self isTrue not

	
]

{ #category : 'testing' }
WsAndCondition >> isTrue [

	^ (elements includes: false) not
]

{ #category : 'printing' }
WsAndCondition >> printOn: aStream [

	aStream << 'AND ('.
	elements
		do: [ :aBoolean | aStream print: aBoolean ]
		separatedBy: [ aStream << ', ' ].
	aStream << $)
]

{ #category : 'elements' }
WsAndCondition >> setTrue: key [
	elements at: key put: true
]
