Class {
	#name : 'WsAndConditionEventTest',
	#superclass : 'TestCase',
	#instVars : [
		'condition',
		'isConditionTrue',
		'variableA',
		'variableC',
		'variableB',
		'isSubconditionTrue'
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
WsAndConditionEventTest >> assertSubcondition [

	self assert: isSubconditionTrue
]

{ #category : 'tests' }
WsAndConditionEventTest >> denyCondition [
	self deny: isConditionTrue 
]

{ #category : 'tests' }
WsAndConditionEventTest >> denySubcondition [

	self deny: isSubconditionTrue
]

{ #category : 'running' }
WsAndConditionEventTest >> setUp [

	| subcondition |
	super setUp.
	condition := WsAndCondition new.
	variableA := condition addFalseVariable.
	subcondition := condition addSubcondition.
	isSubconditionTrue := false.
	subcondition whenTrueDo: [ isSubconditionTrue := true ].
	variableB := subcondition addFalseVariable.
	variableC := subcondition addFalseVariable.
	isConditionTrue := false.
	condition whenTrueDo: [ isConditionTrue := true ]
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderABC [

	self denySubcondition.
	self denyCondition.
	variableA setTrue.
	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self assertSubcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderACB [

	self denySubcondition.
	self denyCondition.
	variableA setTrue.
	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self assertSubcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderBAC [

	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self denySubcondition.
	self denyCondition.
	variableA setTrue.
	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self assertSubcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderBCA [

	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self assertSubcondition.
	self denyCondition.
	variableA setTrue.
	self assertSubcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderCAB [

	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self denySubcondition.
	self denyCondition.
	variableA setTrue.
	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self assertSubcondition.
	self assertCondition
]

{ #category : 'tests' }
WsAndConditionEventTest >> test1Variable2SubconditionVariablesOrderCBA [

	self denySubcondition.
	self denyCondition.
	variableC setTrue.
	self denySubcondition.
	self denyCondition.
	variableB setTrue.
	self assertSubcondition.
	self denyCondition.
	variableA setTrue.
	self assertSubcondition.
	self assertCondition
]
