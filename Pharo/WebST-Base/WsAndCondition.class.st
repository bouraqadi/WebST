Class {
	#name : 'WsAndCondition',
	#superclass : 'WsConditionElement',
	#instVars : [
		'elements',
		'actionBlock'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'instance creation' }
WsAndCondition class >> whenTrueDo: aBlock [
	^self new
		whenTrueDo: aBlock;
		yourself
]

{ #category : 'elements' }
WsAndCondition >> addFalseVariable [

	^self addVariableValue: false.

]

{ #category : 'elements' }
WsAndCondition >> addSubcondition [
	| newSubcondition |
	newSubcondition := self species whenTrueDo: [self update].
	elements add: newSubcondition.
	^ newSubcondition
]

{ #category : 'elements' }
WsAndCondition >> addTrueVariable [

	^ self addVariableValue: true
]

{ #category : 'elements' }
WsAndCondition >> addVariableValue: aBoolean [

	| newVariable |
	newVariable := WsConditionVariable value: aBoolean condition: self.
	elements add: newVariable.
	^ newVariable
]

{ #category : 'updating' }
WsAndCondition >> attemptAction [

	self ifTrueDo: actionBlock
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
	elements := Set new
]

{ #category : 'testing' }
WsAndCondition >> isTrue [

	| falseElements |
	elements ifEmpty: [ ^false ].
	falseElements := elements select: [: var| var isFalse].
	^falseElements isEmpty

]

{ #category : 'printing' }
WsAndCondition >> printOn: aStream [

	aStream << 'AND ('.
	elements
		do: [ :aBoolean | aStream print: aBoolean ]
		separatedBy: [ aStream << ', ' ].
	aStream << $)
]

{ #category : 'updating' }
WsAndCondition >> update [
	self attemptAction 
]

{ #category : 'enumerating' }
WsAndCondition >> whenTrueDo: aBlock [

	actionBlock := aBlock.
	self attemptAction
]
