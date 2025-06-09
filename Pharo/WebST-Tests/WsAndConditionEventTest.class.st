Class {
	#name : 'WsAndConditionEventTest',
	#superclass : 'TestCase',
	#instVars : [
		'condition',
		'isConditionTrue',
		'variableA',
		'variableC',
		'variableB'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsAndConditionEventTest >> assertCondition [
	self assert: isConditionTrue 
]

{ #category : 'tests' }
WsAndConditionEventTest >> denyCondition [
	self deny: isConditionTrue 
]

{ #category : 'running' }
WsAndConditionEventTest >> setUp [

	| subcondition |
	super setUp.
	condition := WsAndCondition new.
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	isConditionTrue := false.
	condition whenTrueDo: [ isConditionTrue := true ]
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderABC [

	self denyCondition.
	variableA setTrue.
	self denyCondition.
	variableB setTrue.
	self denyCondition.
	variableC setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderACB [

	self denyCondition.
	variableA setTrue.
	self denyCondition.
	variableC setTrue.
	self denyCondition.
	variableB setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderBAC [

	self denyCondition.
	variableB setTrue.
	self denyCondition.
	variableA setTrue.
	self denyCondition.
	variableC setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderBCA [

	self denyCondition.
	variableB setTrue.
	self denyCondition.
	variableC setTrue.
	self denyCondition.
	variableA setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderCAB [

	self denyCondition.
	variableC setTrue.
	self denyCondition.
	variableA setTrue.
	self denyCondition.
	variableB setTrue.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderCBA [

	self denyCondition.
	variableC setTrue.
	self denyCondition.
	variableB setTrue.
	self denyCondition.
	variableA setTrue.
	self assertCondition
]
