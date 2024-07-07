Class {
	#name : #WsInitializationCounterForTest,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'viewResetCount',
		'viewInitCount',
		'modelInitCount'
	],
	#category : #'WebST-Tests-Support'
}

{ #category : #accessing }
WsInitializationCounterForTest class >> modelClass [

	^Object
]

{ #category : #'class initialization' }
WsInitializationCounterForTest class >> tagName [

	^'ws-mvc-init-test'
]

{ #category : #accessing }
WsInitializationCounterForTest class >> viewClass [

	<pharoJsSkip>
	^WsMinimalView 
]

{ #category : #initialization }
WsInitializationCounterForTest >> initModel [

	console log: 'initModel'.
	modelInitCount := modelInitCount + 1.
	super initModel
]

{ #category : #initialization }
WsInitializationCounterForTest >> initView [

	console log: 'initView'.
	viewInitCount := viewInitCount + 1.
	super initView
]

{ #category : #initialization }
WsInitializationCounterForTest >> initialize [

	viewResetCount := 0.
	viewInitCount := 0.
	modelInitCount := 0.
	super initialize.

]

{ #category : #accessing }
WsInitializationCounterForTest >> modelInitCount [

	^ modelInitCount
]

{ #category : #initialization }
WsInitializationCounterForTest >> resetView [

	console log: 'resetView'.
	viewResetCount := viewResetCount + 1.
	super resetView
]

{ #category : #accessing }
WsInitializationCounterForTest >> viewInitCount [

	^ viewInitCount
]

{ #category : #accessing }
WsInitializationCounterForTest >> viewResetCount [

	^ viewResetCount
]
