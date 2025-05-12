Class {
	#name : 'WsAndConditionTest',
	#superclass : 'TestCase',
	#instVars : [
		'condition'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsAndConditionTest >> assertCondition [

	self assert: condition isTrue.
	self deny: condition isFalse
]

{ #category : 'tests' }
WsAndConditionTest >> denyCondition [

	self deny: condition isTrue.
	self assert: condition isFalse
]

{ #category : 'tests' }
WsAndConditionTest >> setUp [
	super setUp.
	condition := WsAndCondition new.

]

{ #category : 'tests' }
WsAndConditionTest >> test1False1TrueSwitchFalseToTrue [

	| elementKey |
	elementKey := condition addFalse.
	condition addTrue.
	condition setTrue: elementKey.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test1True1FalseSwitchFalseToTrue [

	| elementKey |
	condition addTrue.
	elementKey := condition addFalse.
	condition setTrue: elementKey.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test2FalseSwitchFalseToTrue [

	| key1 key2 |
	key1 := condition addFalse.
	key2 := condition addFalse.
	self denyCondition. 
	condition setTrue: key2.
	self denyCondition. 
	condition setTrue: key1.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testFalseAfterAdding1False [

	condition addFalse.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testFalseAfterAdding1True1False [

	condition addTrue.
	condition addFalse.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddFalse [

	| doneIfTrueBlock |
	condition addFalse.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self deny: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddFalseThenSwitchToTrue [

	| key doneIfTrueBlock |
	key := condition addFalse.
	doneIfTrueBlock := false.
	condition setTrue: key.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddTrue [

	| doneIfTrueBlock |
	condition addTrue.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueDefault [

	| doneIfTrueBlock |
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testTrue1ElementSwitchFalseToTrue [

	| elementKey |
	elementKey := condition addFalse.
	condition setTrue: elementKey.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testTrueAfterAdding1True [

	condition addTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testTrueByDefault [

	self assertCondition
]
