Class {
	#name : 'WsAndCondition',
	#superclass : 'Object',
	#instVars : [
		'variables'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'variables' }
WsAndCondition >> add: aBoolean [

	| newVariable |
	newVariable := WsConditionVariable value: aBoolean condition: self.
	variables add: newVariable.
	^ newVariable
]

{ #category : 'variables' }
WsAndCondition >> addFalse [

	^self add: false.

]

{ #category : 'variables' }
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
	variables := Set new
]

{ #category : 'testing' }
WsAndCondition >> isFalse [
	^ self isTrue not

	
]

{ #category : 'testing' }
WsAndCondition >> isTrue [

	^ (self values includes: false) not
]

{ #category : 'printing' }
WsAndCondition >> printOn: aStream [

	aStream << 'AND ('.
	variables
		do: [ :aBoolean | aStream print: aBoolean ]
		separatedBy: [ aStream << ', ' ].
	aStream << $)
]

{ #category : 'updating' }
WsAndCondition >> update [
	^self
]

{ #category : 'variables' }
WsAndCondition >> values [
	^variables collect: [: var| var value]
]
