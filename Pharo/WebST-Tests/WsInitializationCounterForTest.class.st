Class {
	#name : 'WsInitializationCounterForTest',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'postConnectInitCount',
		'preConnectInitCount',
		'readyInitCount'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsInitializationCounterForTest class >> modelClass [

	^Object
]

{ #category : 'accessing' }
WsInitializationCounterForTest class >> viewClass [

	<pharoJsSkip>
	^WsMinimalView 
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> postConnectInitCount [

	^ postConnectInitCount ifNil: [ 0 ]
]

{ #category : 'initialization' }
WsInitializationCounterForTest >> postConnectInitialize [

	console log: 'postConnectInitialize'.
	postConnectInitCount := self postConnectInitCount + 1.
	super postConnectInitialize
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> preConnectInitCount [

	^ preConnectInitCount ifNil: [ 0 ]
]

{ #category : 'initialization' }
WsInitializationCounterForTest >> preConnectInitialize [

	super preConnectInitialize.
	console log: 'preConnectInitialize'.
	preConnectInitCount := self preConnectInitCount + 1.

]

{ #category : 'initialization' }
WsInitializationCounterForTest >> reset [
	preConnectInitCount := nil.
	postConnectInitCount := nil.
	super reset.

]
