Class {
	#name : 'WsConditionVariable',
	#superclass : 'WsConditionElement',
	#instVars : [
		'value',
		'condition'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'instance creation' }
WsConditionVariable class >> value: aBoolean condition: aCondition [
	^self new
		value: aBoolean;
		condition: aCondition;
		yourself
]

{ #category : 'accessing' }
WsConditionVariable >> condition [

	^ condition
]

{ #category : 'accessing' }
WsConditionVariable >> condition: anObject [

	condition := anObject
]

{ #category : 'initialization' }
WsConditionVariable >> initialize [ 
	super initialize.
	self setFalse.
]

{ #category : 'testing' }
WsConditionVariable >> isTrue [
	^self value
]

{ #category : 'printing' }
WsConditionVariable >> printOn: aStream [
	aStream << '[['; print: self value; <<  ']]'
]

{ #category : 'setting' }
WsConditionVariable >> setFalse [
	self value: false
]

{ #category : 'setting' }
WsConditionVariable >> setTrue [
	self value: true
]

{ #category : 'setting' }
WsConditionVariable >> updateCondition [
	condition ifNil: [ ^self ].
	condition update
]

{ #category : 'accessing' }
WsConditionVariable >> value [
	^value
]

{ #category : 'accessing' }
WsConditionVariable >> value: anObject [

	value := anObject.
	self updateCondition 
]
