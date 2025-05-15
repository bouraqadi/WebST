Class {
	#name : 'WsMiddleCompositeForInitTest',
	#superclass : 'WsBasicComponentForInitTest',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'basicComponent'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsMiddleCompositeForInitTest class >> viewClass [
	<pharoJsSkip>
	^WsMiddleViewForInitTest 
]

{ #category : 'accessing' }
WsMiddleCompositeForInitTest >> basicComponent [
	^basicComponent 
]

{ #category : 'initialization' }
WsMiddleCompositeForInitTest >> getReady [

	super getReady.
	basicComponent := self viewFirstComponent: WsBasicComponentForInitTest 
]
