Class {
	#name : 'WsInitializationCounterForTest',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'readyCount',
		'startCount'
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

{ #category : 'initialization' }
WsInitializationCounterForTest >> getReady [

	super getReady.
	console log: 'beReady'.
	readyCount := self readyCount + 1.

]

{ #category : 'accessing' }
WsInitializationCounterForTest >> readyCount [

	^ readyCount ifNil: [ 0 ]
]

{ #category : 'initialization' }
WsInitializationCounterForTest >> reset [
	readyCount := nil.
	startCount := nil.
	super reset.

]

{ #category : 'initialization' }
WsInitializationCounterForTest >> start [

	console log: 'start'.
	startCount := self startCount + 1.
	super start
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> startCount [

	^ startCount ifNil: [ 0 ]
]
