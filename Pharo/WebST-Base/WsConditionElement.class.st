Class {
	#name : 'WsConditionElement',
	#superclass : 'Object',
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'testing' }
WsConditionElement >> isFalse [
	^ self isTrue not

	
]

{ #category : 'testing' }
WsConditionElement >> isTrue [
	^ self subclassResponsibility 
]
