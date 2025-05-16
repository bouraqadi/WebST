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

	self assertCondition: condition
]

{ #category : 'tests' }
WsAndConditionTest >> assertCondition: aCondition [

	self assert: aCondition isTrue.
	self deny: aCondition isFalse
]

{ #category : 'tests' }
WsAndConditionTest >> denyCondition [

	self denyCondition: condition
]

{ #category : 'tests' }
WsAndConditionTest >> denyCondition: aCondition [

	self deny: aCondition isTrue.
	self assert: aCondition isFalse
]

{ #category : 'tests' }
WsAndConditionTest >> setUp [
	super setUp.
	condition := WsAndCondition new.

]

{ #category : 'tests' }
WsAndConditionTest >> test1False1TrueSwitchFalseToTrue [

	| variable |
	variable := condition addFalseVariable.
	condition addTrueVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test1Subcondition [

	| subcondition variable |
	subcondition := condition addSubcondition.
	self denyCondition: subcondition.
	variable := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variable setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test1True1FalseSwitchFalseToTrue [

	| variable |
	condition addTrueVariable.
	variable := condition addFalseVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> test2FalseSwitchFalseToTrue [

	| var1 var2 |
	var1 := condition addFalseVariable.
	var2 := condition addFalseVariable.
	self denyCondition. 
	var2 setTrue.
	self denyCondition. 
	var1 setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testFalseAfterAdding1False [

	condition addFalseVariable.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testFalseAfterAdding1True1False [

	condition addTrueVariable.
	condition addFalseVariable.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testFalseByDefault [

	self denyCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testIfFalseDefault [

	| doneIfTrueBlock |
	doneIfTrueBlock := false.
	condition ifFalseDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddFalse [

	| doneIfTrueBlock |
	condition addFalseVariable.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self deny: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddFalseThenSwitchToTrue [

	| variable doneIfTrueBlock |
	variable := condition addFalseVariable.
	doneIfTrueBlock := false.
	variable setTrue.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueAddTrue [

	| doneIfTrueBlock |
	condition addTrueVariable.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testIfTrueDefault [

	| doneIfTrueBlock |
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self deny: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionTest >> testTrue1ElementSwitchFalseToTrue [

	| variable |
	variable := condition addFalseVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testTrueAfterAdding1True [

	condition addTrueVariable.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionTest >> testWhenTrueDefault [
	|done|
	done := false.
	condition whenTrueDo: [ done := true ].
	self deny: done
]

{ #category : 'tests' }
WsAndConditionTest >> testWhenTrueWith1False [

	| done |
	done := false.
	condition addFalseVariable.
	condition whenTrueDo: [ done := true ].
	self deny: done
]

{ #category : 'tests' }
WsAndConditionTest >> testWhenTrueWith1FalseSwitch [

	| done variable |
	done := false.
	variable := condition addFalseVariable.
	condition whenTrueDo: [ done := true ].
	variable setTrue.
	self assert: done
]

{ #category : 'tests' }
WsAndConditionTest >> testWhenTrueWith1True [

	| done |
	done := false.
	condition addTrueVariable.
	condition whenTrueDo: [ done := true ].
	self assert: done
]

{ #category : 'tests' }
WsAndConditionTest >> testWhenTrueWith2FalseSwitch [

	| done var1 var2 |
	done := false.
	var1 := condition addFalseVariable.
	var2 := condition addFalseVariable.
	condition whenTrueDo: [ done := true ].
	var1 setTrue.
	self deny: done.
	var2 setTrue.
	self assert: done
]
