Class {
	#name : 'WsConditionElement',
	#superclass : 'Object',
	#instVars : [
		'condition'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'accessing' }
WsConditionElement class >> condition: aCondition [

	^ self new
		  condition: aCondition;
		  yourself
]

{ #category : 'accessing' }
WsConditionElement >> condition [

	^ condition
]

{ #category : 'accessing' }
WsConditionElement >> condition: anObject [

	condition := anObject
]

{ #category : 'testing' }
WsConditionElement >> isFalse [
	^ self isTrue not

	
]

{ #category : 'testing' }
WsConditionElement >> isTrue [
	^ self subclassResponsibility 
]

{ #category : 'setting' }
WsConditionElement >> updateCondition [
	condition ifNil: [ ^self ].
	condition update
]
