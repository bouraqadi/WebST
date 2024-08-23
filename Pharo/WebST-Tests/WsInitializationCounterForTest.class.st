Class {
	#name : 'WsInitializationCounterForTest',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'viewResetCount',
		'viewInitCount',
		'modelInitCount'
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
WsInitializationCounterForTest >> initModel [

	console log: 'initModel'.
	modelInitCount := self modelInitCount + 1.
	super initModel
]

{ #category : 'initialization' }
WsInitializationCounterForTest >> initView [

	console log: 'initView'.
	viewInitCount := self viewInitCount + 1.
	super initView
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> modelInitCount [

	^ modelInitCount ifNil: [ 0 ]
]

{ #category : 'initialization' }
WsInitializationCounterForTest >> resetView [

	console log: 'resetView'.
	viewResetCount := self viewResetCount + 1.
	super resetView
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> viewInitCount [

	^ viewInitCount ifNil: [ 0 ]
]

{ #category : 'accessing' }
WsInitializationCounterForTest >> viewResetCount [

	^ viewResetCount ifNil: [ 0 ]
]
