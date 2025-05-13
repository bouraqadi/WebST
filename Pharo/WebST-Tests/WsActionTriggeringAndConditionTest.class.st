Class {
	#name : 'WsActionTriggeringAndConditionTest',
	#superclass : 'TestCase',
	#instVars : [
		'condition'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> setUp [
	super setUp.
	condition := WsActionTriggeringAndCondition new.
	
]

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> testWhenTrueDefault [
	|done|
	done := false.
	condition whenTrueDo: [ done := true ].
	self assert: done
]

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> testWhenTrueWith1False [

	| done |
	done := false.
	condition addFalse.
	condition whenTrueDo: [ done := true ].
	self deny: done
]

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> testWhenTrueWith1FalseSwitch [

	| done variable |
	done := false.
	variable := condition addFalse.
	condition whenTrueDo: [ done := true ].
	variable setTrue.
	self assert: done
]

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> testWhenTrueWith1True [

	| done |
	done := false.
	condition addTrue.
	condition whenTrueDo: [ done := true ].
	self assert: done
]

{ #category : 'tests' }
WsActionTriggeringAndConditionTest >> testWhenTrueWith2FalseSwitch [

	| done var1 var2 |
	done := false.
	var1 := condition addFalse.
	var2 := condition addFalse.
	condition whenTrueDo: [ done := true ].
	var1 setTrue.
	self deny: done.
	var2 setTrue.
	self assert: done
]
