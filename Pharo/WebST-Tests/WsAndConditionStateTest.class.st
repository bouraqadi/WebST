Class {
	#name : 'WsAndConditionStateTest',
	#superclass : 'TestCase',
	#instVars : [
		'condition'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsAndConditionStateTest >> assertCondition [

	self assertCondition: condition
]

{ #category : 'tests' }
WsAndConditionStateTest >> assertCondition: aCondition [

	self assert: aCondition isTrue.
	self deny: aCondition isFalse
]

{ #category : 'tests' }
WsAndConditionStateTest >> denyCondition [

	self denyCondition: condition
]

{ #category : 'tests' }
WsAndConditionStateTest >> denyCondition: aCondition [

	self deny: aCondition isTrue.
	self assert: aCondition isFalse
]

{ #category : 'tests' }
WsAndConditionStateTest >> setUp [
	super setUp.
	condition := WsAndCondition new.

]

{ #category : 'tests' }
WsAndConditionStateTest >> test1False1TrueSwitchFalseToTrue [

	| variable |
	variable := condition addFalseVariable.
	condition addTrueVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Subcondition1Variable [

	| subcondition variable |
	subcondition := condition addSubcondition.
	variable := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variable setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Subcondition2Variables [

	| subcondition variable1 variable2|
	subcondition := condition addSubcondition.
	variable1 := subcondition addFalseVariable.
	variable2 := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variable1 setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variable2 setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1SubconditionDefault [

	| subcondition |
	subcondition := condition addSubcondition.
	self denyCondition: subcondition.

]

{ #category : 'tests' }
WsAndConditionStateTest >> test1True1FalseSwitchFalseToTrue [

	| variable |
	condition addTrueVariable.
	variable := condition addFalseVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderABC [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderACB [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderBAC [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderBCA [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self assertCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderCAB [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test1Variable2SubconditionVariablesOrderCBA [

	| variableA subcondition variableB variableC |
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	self denyCondition: subcondition.
	self denyCondition.
	variableC setTrue.
	self denyCondition: subcondition.
	self denyCondition.
	variableB setTrue.
	self assertCondition: subcondition.
	self denyCondition.
	variableA setTrue.
	self assertCondition: subcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> test2FalseSwitchFalseToTrue [

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
WsAndConditionStateTest >> test2Subconditions2VariablesEach [

	| subconditionA variables subconditionB |
	subconditionA := condition addSubcondition.
	variables := Set new.
	2 timesRepeat: [ variables add: subconditionA addFalseVariable ].
	subconditionB := condition addSubcondition.
	2 timesRepeat: [ variables add: subconditionB addFalseVariable ].
	self denyCondition.
	variables
		do: [ :var | var setTrue ]
		separatedBy: [ self denyCondition ].
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testFalseAfterAdding1False [

	condition addFalseVariable.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testFalseAfterAdding1True1False [

	condition addTrueVariable.
	condition addFalseVariable.
	self denyCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testFalseByDefault [

	self denyCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testIfFalseDefault [

	| doneIfTrueBlock |
	doneIfTrueBlock := false.
	condition ifFalseDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionStateTest >> testIfTrueAddFalse [

	| doneIfTrueBlock |
	condition addFalseVariable.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self deny: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionStateTest >> testIfTrueAddFalseThenSwitchToTrue [

	| variable doneIfTrueBlock |
	variable := condition addFalseVariable.
	doneIfTrueBlock := false.
	variable setTrue.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionStateTest >> testIfTrueAddTrue [

	| doneIfTrueBlock |
	condition addTrueVariable.
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self assert: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionStateTest >> testIfTrueDefault [

	| doneIfTrueBlock |
	doneIfTrueBlock := false.
	condition ifTrueDo: [ doneIfTrueBlock := true ].
	self deny: doneIfTrueBlock
]

{ #category : 'tests' }
WsAndConditionStateTest >> testTrue1ElementSwitchFalseToTrue [

	| variable |
	variable := condition addFalseVariable.
	variable setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testTrueAfterAdding1True [

	condition addTrueVariable.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionStateTest >> testWhenTrueDefault [
	|done|
	done := false.
	condition whenTrueDo: [ done := true ].
	self deny: done
]

{ #category : 'tests' }
WsAndConditionStateTest >> testWhenTrueWith1False [

	| done |
	done := false.
	condition addFalseVariable.
	condition whenTrueDo: [ done := true ].
	self deny: done
]

{ #category : 'tests' }
WsAndConditionStateTest >> testWhenTrueWith1FalseSwitch [

	| done variable |
	done := false.
	variable := condition addFalseVariable.
	condition whenTrueDo: [ done := true ].
	variable setTrue.
	self assert: done
]

{ #category : 'tests' }
WsAndConditionStateTest >> testWhenTrueWith1True [

	| done |
	done := false.
	condition addTrueVariable.
	condition whenTrueDo: [ done := true ].
	self assert: done
]

{ #category : 'tests' }
WsAndConditionStateTest >> testWhenTrueWith2FalseSwitch [

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
