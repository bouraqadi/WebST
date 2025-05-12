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

	| done key |
	done := false.
	key := condition addFalse.
	condition whenTrueDo: [ done := true ].
	condition setTrue: key.
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

	| done key1 key2 |
	done := false.
	key1 := condition addFalse.
	key2 := condition addFalse.
	condition whenTrueDo: [ done := true ].
	condition setTrue: key1.
	self deny: done.
	condition setTrue: key2.
	self assert: done
]
