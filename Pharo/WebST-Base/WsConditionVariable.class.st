Class {
	#name : 'WsConditionVariable',
	#superclass : 'WsConditionElement',
	#instVars : [
		'value'
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

{ #category : 'accessing' }
WsConditionVariable >> value [
	^value
]

{ #category : 'accessing' }
WsConditionVariable >> value: anObject [

	value := anObject.
	self updateCondition 
]
