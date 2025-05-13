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

	| variable |
	variable := condition addFalse.
	condition addTrue.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test1True1FalseSwitchFalseToTrue [

	| variable |
	condition addTrue.
	variable := condition addFalse.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test2FalseSwitchFalseToTrue [

	| var1 var2 |
	var1 := condition addFalse.
	var2 := condition addFalse.
	self denyCondition. 
	var2 setTrue.
	self denyCondition. 
	var1 setTrue.
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

	| variable doneIfTrueBlock |
	variable := condition addFalse.
	doneIfTrueBlock := false.
	variable setTrue.
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

	| variable |
	variable := condition addFalse.
	variable setTrue.
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
